Class {
	#name : 'FEBFoodInventoryOld',
	#superclass : 'Object',
	#instVars : [
		'availableAmount',
		'pricePerUnit'
	],
	#category : 'FE_Beta-Model',
	#package : 'FE_Beta-Model'
}

{ #category : 'accessing' }
FEBFoodInventoryOld >> availableAmount [

	^ availableAmount
]

{ #category : 'accessing' }
FEBFoodInventoryOld >> availableAmount: anObject [

	availableAmount := anObject
]

{ #category : 'accessing' }
FEBFoodInventoryOld >> pricePerUnit [

	^ pricePerUnit
]

{ #category : 'accessing' }
FEBFoodInventoryOld >> pricePerUnit: anObject [

	pricePerUnit := anObject
]

{ #category : 'as yet unclassified' }
FEBFoodInventoryOld >> takeUpTo: requestedAmount withMoneyUpTo: availableMoney [

	| amount affordableAmount |
	amount := requestedAmount min: availableAmount.
	
	affordableAmount := (availableMoney / pricePerUnit) asInteger.
	amount := amount min: affordableAmount .
	
	availableAmount := availableAmount - amount.
	^ amount
]
