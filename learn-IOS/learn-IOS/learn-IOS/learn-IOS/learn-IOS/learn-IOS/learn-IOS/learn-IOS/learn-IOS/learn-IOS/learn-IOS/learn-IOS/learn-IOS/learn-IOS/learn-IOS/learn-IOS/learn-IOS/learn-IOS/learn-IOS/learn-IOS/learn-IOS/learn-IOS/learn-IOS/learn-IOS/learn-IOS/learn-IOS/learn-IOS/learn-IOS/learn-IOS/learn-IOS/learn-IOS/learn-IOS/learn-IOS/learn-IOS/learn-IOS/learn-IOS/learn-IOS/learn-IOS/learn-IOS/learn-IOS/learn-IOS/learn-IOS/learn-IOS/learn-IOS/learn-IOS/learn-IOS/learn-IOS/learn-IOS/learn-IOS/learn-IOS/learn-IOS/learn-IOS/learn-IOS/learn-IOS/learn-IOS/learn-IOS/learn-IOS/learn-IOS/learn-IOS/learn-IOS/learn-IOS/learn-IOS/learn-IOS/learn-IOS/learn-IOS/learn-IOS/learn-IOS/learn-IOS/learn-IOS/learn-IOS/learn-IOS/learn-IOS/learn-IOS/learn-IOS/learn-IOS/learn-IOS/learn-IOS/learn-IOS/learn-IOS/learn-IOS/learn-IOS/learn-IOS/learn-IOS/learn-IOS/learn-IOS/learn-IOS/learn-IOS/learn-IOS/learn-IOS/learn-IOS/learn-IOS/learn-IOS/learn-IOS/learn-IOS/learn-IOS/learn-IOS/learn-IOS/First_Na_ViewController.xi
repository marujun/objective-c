<?xml version="1.0" encoding="UTF-8"?>
<archive type="com.apple.InterfaceBuilder3.CocoaTouch.iPad.XIB" version="8.00">
	<data>
		<int key="IBDocument.SystemTarget">1536</int>
		<string key="IBDocument.SystemVersion">11G63b</string>
		<string key="IBDocument.InterfaceBuilderVersion">2843</string>
		<string key="IBDocument.AppKitVersion">1138.51</string>
		<string key="IBDocument.HIToolboxVersion">569.00</string>
		<object class="NSMutableDictionary" key="IBDocument.PluginVersions">
			<string key="NS.key.0">com.apple.InterfaceBuilder.IBCocoaTouchPlugin</string>
			<string key="NS.object.0">1929</string>
		</object>
		<array key="IBDocument.IntegratedClassDependencies">
			<string>IBNSLayoutConstraint</string>
			<string>IBProxyObject</string>
			<string>IBUIButton</string>
			<string>IBUIView</string>
		</array>
		<array key="IBDocument.PluginDependencies">
			<string>com.apple.InterfaceBuilder.IBCocoaTouchPlugin</string>
		</array>
		<object class="NSMutableDictionary" key="IBDocument.Metadata">
			<string key="NS.key.0">PluginDependencyRecalculationVersion</string>
			<integer value="1" key="NS.object.0"/>
		</object>
		<array class="NSMutableArray" key="IBDocument.RootObjects" id="1000">
			<object class="IBProxyObject" id="841351856">
				<string key="IBProxiedObjectIdentifier">IBFilesOwner</string>
				<string key="targetRuntimeIdentifier">IBIPadFramework</string>
			</object>
			<object class="IBProxyObject" id="606714003">
				<string key="IBProxiedObjectIdentifier">IBFirstResponder</string>
				<string key="targetRuntimeIdentifier">IBIPadFramework</string>
			</object>
			<object class="IBUIView" id="766721923">
				<reference key="NSNextResponder"/>
				<int key="NSvFlags">292</int>
				<array class="NSMutableArray" key="NSSubviews">
					<object class="IBUIButton" id="585103726">
						<reference key="NSNextResponder" ref="766721923"/>
						<int key="NSvFlags">292</int>
						<string key="NSFrame">{{308, 310}, {152, 44}}</string>
						<reference key="NSSuperview" ref="766721923"/>
						<string key="NSReuseIdentifierKey">_NS:9</string>
						<bool key="IBUIOpaque">NO</bool>
						<string key="targetRuntimeIdentifier">IBIPadFramework</string>
						<int key="IBUIContentHorizontalAlignment">0</int>
						<int key="IBUIContentVerticalAlignment">0</int>
						<int key="IBUIButtonType">1</int>
						<string key="IBUINormalTitle">Goto SecondView</string>
						<object class="NSColor" key="IBUIHighlightedTitleColor">
							<int key="NSColorSpace">3</int>
							<bytes key="NSWhite">MQA</bytes>
						</object>
						<object class="NSColor" key="IBUINormalTitleColor">
							<int key="NSColorSpace">1</int>
							<bytes key="NSRGB">MC4xOTYwNzg0MzQ2IDAuMzA5ODAzOTMyOSAwLjUyMTU2ODY1NgA</bytes>
						</object>
						<object class="NSColor" key="IBUINormalTitleShadowColor">
							<int key="NSColorSpace">3</int>
							<bytes key="NSWhite">MC41AA</bytes>
						</object>
						<object class="IBUIFontDescription" key="IBUIFontDescription">
							<int key="type">2</int>
							<double key="pointSize">15</double>
						</object>
						<object class="NSFont" key="IBUIFont">
							<string key="NSName">Helvetica-Bold</string>
							<double key="NSSize">15</double>
							<int key="NSfFlags">16</int>
						</object>
					</object>
				</array>
				<string key="NSFrame">{{0, 20}, {768, 1004}}</string>
				<reference key="NSSuperview"/>
				<object class="NSColor" key="IBUIBackgroundColor">
					<int key="NSColorSpace">3</int>
					<bytes key="NSWhite">MQA</bytes>
					<object class="NSColorSpace" key="NSCustomColorSpace">
						<int key="NSID">2</int>
					</object>
				</object>
				<bool key="IBUIClearsContextBeforeDrawing">NO</bool>
				<object class="IBUISimulatedStatusBarMetrics" key="IBUISimulatedStatusBarMetrics">
					<int key="IBUIStatusBarStyle">2</int>
				</object>
				<string key="targetRuntimeIdentifier">IBIPadFramework</string>
			</object>
		</array>
		<object class="IBObjectContainer" key="IBDocument.Objects">
			<array class="NSMutableArray" key="connectionRecords">
				<object class="IBConnectionRecord">
					<object class="IBCocoaTouchOutletConnection" key="connection">
						<string key="label">view</string>
						<reference key="source" ref="841351856"/>
						<reference key="destination" ref="766721923"/>
					</object>
					<int key="connectionID">3</int>
				</object>
			</array>
			<object class="IBMutableOrderedSet" key="objectRecords">
				<array key="orderedObjects">
					<object class="IBObjectRecord">
						<int key="objectID">0</int>
						<array key="object" id="0"/>
						<reference key="children" ref="1000"/>
						<nil key="parent"/>
					</object>
					<object class="IBObjectRecord">
						<int key="objectID">-1</int>
						<reference key="object" ref="841351856"/>
						<reference key="parent" ref="0"/>
						<string key="objectName">File's Owner</string>
					</object>
					<object class="IBObjectRecord">
						<int key="objectID">-2</int>
						<reference key="object" ref="606714003"/>
						<reference key="parent" ref="0"/>
					</object>
					<object class="IBObjectRecord">
						<int key="objectID">2</int>
						<reference key="object" ref="766721923"/>
						<array class="NSMutableArray" key="children">
							<object class="IBNSLayoutConstraint" id="938257522">
								<reference key="firstItem" ref="585103726"/>
								<int key="firstAttribute">3</int>
								<int key="relation">0</int>
								<reference key="secondItem" ref="766721923"/>
								<int key="secondAttribute">3</int>
								<float key="multiplier">1</float>
								<object class="IBLayoutConstant" key="constant">
									<double key="value">310</double>
								</object>
								<float key="priority">1000</float>
								<reference key="containingView" ref="766721923"/>
								<int key="scoringType">3</int>
								<float key="scoringTypeFloat">9</float>
								<int key="contentType">3</int>
							</object>
							<object class="IBNSLayoutConstraint" id="340640246">
								<reference key="firstItem" ref="585103726"/>
								<int key="firstAttribute">9</int>
								<int key="relation">0</int>
								<reference key="secondItem" ref="766721923"/>
								<int key="secondAttribute">9</int>
								<float key="multiplier">1</float>
								<object class="IBLayoutConstant" key="constant">
									<double key="value">0.0</double>
								</object>
								<float key="priority">1000</float>
								<reference key="containingView" ref="766721923"/>
								<int key="scoringType">5</int>
								<float key="scoringTypeFloat">22</float>
								<int key="contentType">2</int>
							</object>
							<reference ref="585103726"/>
						</array>
						<reference key="parent" ref="0"/>
					</object>
					<object class="IBObjectRecord">
						<int key="objectID">4</int>
						<reference key="object" ref="585103726"/>
						<reference key="parent" ref="766721923"/>
					</object>
					<object class="IBObjectRecord">
						<int key="objectID">7</int>
						<reference key="object" ref="340640246"/>
						<reference key="parent" ref="766721923"/>
					</object>
					<object class="IBObjectRecord">
						<int key="objectID">8</int>
						<reference key="object" ref="938257522"/>
						<reference key="parent" ref="766721923"/>
					</object>
				</array>
			</object>
			<dictionary class="NSMutableDictionary" key="flattenedProperties">
				<string key="-1.CustomClassName">First_Na_ViewController</string>
				<string key="-1.IBPluginDependency">com.apple.InterfaceBuilder.IBCocoaTouchPlugin</string>
				<string key="-2.CustomClassName">UIResponder</string>
				<string key="-2.IBPluginDependency">com.apple.InterfaceBuilder.IBCocoaTouchPlugin</string>
				<string key="2.IBPluginDependency">com.apple.InterfaceBuilder.IBCocoaTouchPlugin</string>
				<array class="NSMutableArray" key="2.IBViewMetadataConstraints">
					<reference ref="340640246"/>
					<reference ref="938257522"/>
				</array>
				<string key="4.IBPluginDependency">com.apple.InterfaceBuilder.IBCocoaTouchPlugin</string>
				<boolean value="NO" key="4.IBViewMetadataTranslatesAutoresizingMaskIntoConstraints"/>
				<string key="7.IBPluginDependency">com.apple.InterfaceBuilder.IBCocoaTouchPlugin</string>
				<string key="8.IBPluginDependency">com.apple.InterfaceBuilder.IBCocoaTouchPlugin</string>
			</dictionary>
			<dictionary class="NSMutableDictionary" key="unlocalizedProperties"/>
			<nil key="activeLocalization"/>
			<dictionary class="NSMutableDictionary" key="localizations"/>
			<nil key="sourceID"/>
			<int key="maxID">8</int>
		</object>
		<object class="IBClassDescriber" key="IBDocument.Classes"/>
		<int key="IBDocument.localizationMode">0</int>
		<string key="IBDocument.TargetRuntimeIdentifier">IBIPadFramework</string>
		<bool key="IBDocument.PluginDeclaredDependenciesTrackSystemTargetVersion">YES</bool>
		<int key="IBDocument.defaultPropertyAccessControl">3</int>
		<bool key="IBDocument.UseAutolayout">YES</bool>
		<string key="IBCocoaTouchPluginVersion">1929</string>
	</data>
</archive>
