#import geojson for nabes
#conv to polygon
#for each bar in a list with id, lat, lng
#check to see which nabe each bar is in 
#return list of id, nabe

import json
import shapely
from shapely.geometry import Point, shape
import csv

def main():
	print ("hello!")
	# load GeoJSON file containing sectors
	with open('48201.geojson', 'r') as f:
	    js = json.load(f)

	print (str(len(js['features'])) + " neighborhoods loaded")

	bars = []

	# construct point based on lat/long returned by geocoder
	with open('bars_to_nabe.csv', 'rb') as csvfile:
		tabcreader = csv.reader(csvfile, delimiter=',', quotechar='"')
		for row in tabcreader:
			b = bar(row[0],row[1],float(row[3]),float(row[2]))
			bars.append(b)

	print(str(len(bars)) + " bars loaded")

	with open("nabe_out.csv","r+") as f:
   		for b in bars:
			for feature in js['features']:
				polygon = shape(feature['geometry'])
				if polygon.contains(b.point):
					b.nabe = feature['properties']['label']
					print(b.name + " is in " + b.nabe)
					f.write(str(b.dump()) + '\n')

class bar():
	

	def __init__(self,id,name,lat,lng):
		self.id = id
		self.name = name
		self.lat = lat
		self.lng = lng
		self.point = Point(self.lat, self.lng)
		self.nabe = ""


	def dump(self):
		return self.id + "," + self.nabe

if __name__ == "__main__": main()    




