Class {
	#name : 'FEBShoppingStrategy',
	#superclass : 'Object',
	#category : 'FE_Beta-Model',
	#package : 'FE_Beta-Model'
}

{ #category : 'as yet unclassified' }
FEBShoppingStrategy >> shopFor: aHousehold using: aShoppingList [

	self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
FEBShoppingStrategy >> unvisitedOutletClosestTo: aCell from: aCollectionOfOutlets [

	| sortedUnvisitedOutlets |
	
	sortedUnvisitedOutlets := aCollectionOfOutlets sorted: [ :a :b |
		(a cell distanceTo: aCell) < (b cell distanceTo: aCell) ].
	
	^ sortedUnvisitedOutlets first
]
