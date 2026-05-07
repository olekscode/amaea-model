Class {
	#name : 'FEBShoppingListTest',
	#superclass : 'TestCase',
	#instVars : [
		'shoppingList',
		'meat',
		'vegetables'
	],
	#category : 'FE_Beta-Model-Tests',
	#package : 'FE_Beta-Model-Tests'
}

{ #category : 'running' }
FEBShoppingListTest >> setUp [

	super setUp.
	shoppingList := FEBShoppingList new.
	
	meat := FEBFoodCategory
		named: 'Meat'
		shelfLifeInFridge: 5
		outsideFridge: 2.
			
	vegetables := FEBFoodCategory
		named: 'Vegetables'
		shelfLifeInFridge: 7
		outsideFridge: 3.
]

{ #category : 'tests' }
FEBShoppingListTest >> testAddEssential [

	shoppingList addEssentialNeedOf: meat quantity: 5.
	
	self assert: shoppingList hasEssentialNeeds.
	self assert: (shoppingList essentialNeedOf: meat) equals: 5.
]

{ #category : 'tests' }
FEBShoppingListTest >> testAddEssentialAndStorage [

	shoppingList addEssentialNeedOf: meat quantity: 5.
	shoppingList addEssentialNeedOf: vegetables quantity: 5.
	shoppingList addStorageNeedOf: vegetables quantity: 3.
	
	self assert: shoppingList hasEssentialNeeds.
	self assert: shoppingList hasStorageNeeds.
	
	self assert: (shoppingList essentialNeedOf: meat) equals: 5.
	self assert: (shoppingList essentialNeedOf: vegetables) equals: 5.
	self assert: (shoppingList storageNeedOf: vegetables) equals: 3
]

{ #category : 'tests' }
FEBShoppingListTest >> testAddStorage [

	shoppingList addStorageNeedOf: vegetables quantity: 7.
	
	self assert: shoppingList hasStorageNeeds.
	self assert: (shoppingList storageNeedOf: vegetables) equals: 7
]

{ #category : 'tests' }
FEBShoppingListTest >> testDecreaseNeedOf [

	shoppingList addEssentialNeedOf: meat quantity: 5.
	shoppingList addEssentialNeedOf: vegetables quantity: 5.
	shoppingList addStorageNeedOf: meat quantity: 10.
	shoppingList addStorageNeedOf: vegetables quantity: 10.
	
	shoppingList decreaseNeedOf: meat by: 3.
	shoppingList decreaseNeedOf: vegetables by: 7.
	
	self assert: (shoppingList essentialNeedOf: meat) equals: 2.
	self assert: (shoppingList storageNeedOf: meat) equals: 10.
	
	self assert: (shoppingList essentialNeedOf: vegetables) equals: 0.
	self assert: (shoppingList storageNeedOf: vegetables) equals: 8
]

{ #category : 'tests' }
FEBShoppingListTest >> testDecreaseNeedTooMuch [

	shoppingList addEssentialNeedOf: meat quantity: 5.
	shoppingList decreaseNeedOf: meat by: 100.
	
	self assert: (shoppingList essentialNeedOf: meat) equals: 0.
	self assert: (shoppingList storageNeedOf: meat) equals: 0
]

{ #category : 'tests' }
FEBShoppingListTest >> testEmptyListHasNoEssentialNeeds [

	self deny: shoppingList hasEssentialNeeds 
]

{ #category : 'tests' }
FEBShoppingListTest >> testEmptyListHasNoStorageNeeds [

	self deny: shoppingList hasStorageNeeds 
]

{ #category : 'tests' }
FEBShoppingListTest >> testEssentialNeedOfMissingCategoryIsZero [
	
	self assert: (shoppingList essentialNeedOf: meat) equals: 0.
]

{ #category : 'tests' }
FEBShoppingListTest >> testHasAnyNeeds [

	self deny: shoppingList hasAnyNeeds.
	
	shoppingList addEssentialNeedOf: meat quantity: 5.
	self assert: shoppingList hasAnyNeeds.
	
	shoppingList decreaseNeedOf: meat by: 5.
	self deny: shoppingList hasAnyNeeds.
	
	shoppingList addStorageNeedOf: meat quantity: 2.
	self assert: shoppingList hasAnyNeeds
]

{ #category : 'tests' }
FEBShoppingListTest >> testStorageNeedOfMissingCategoryIsZero [
	
	self assert: (shoppingList storageNeedOf: meat) equals: 0.
]
