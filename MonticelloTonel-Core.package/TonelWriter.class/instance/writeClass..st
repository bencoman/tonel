writing
writeClass: aClassDefinition
	[ 
		self fileUtils 
			writeStreamFor: (self fileNameFor: aClassDefinition) 
			in: self packageDir 
			do: [ :aStream | 
				self writeClassDefinition: aClassDefinition on: aStream.
				self writeClassSideMethodDefinitions: aClassDefinition on: aStream.
				self writeInstanceSideMethodDefinitions: aClassDefinition on: aStream ] ]
	on: TonelShouldIgnore
	do: [ :e | self logCr: 'ignoring: ', aClassDefinition asString ]