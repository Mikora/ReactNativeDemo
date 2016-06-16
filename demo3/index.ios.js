/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */
 'use strict';

 var React = require('react');
 var ReactNative = require('react-native');
 var {
   Linking,
   StyleSheet,
   Text,
   TouchableOpacity,
   View,
   AppRegistry
 } = ReactNative;

 var { NativeModules } = require('react-native');
 var RCTDemo=NativeModules.RCTDemo;

 var OpenURLButton = React.createClass({

   propTypes: {
     url: React.PropTypes.string,
   },

   handleClick: function() {
     /*Linking.canOpenURL(this.props.url).then(supported => {
       if (supported) {
         Linking.openURL(this.props.url);
       } else {
         console.log('Don\'t know how to open URI: ' + this.props.url);
       }
     });*/
   },

   render: function() {
     return (
       <TouchableOpacity
         onPress={()=>RCTDemo.RNAddEvent({'name':'huangcheng'})}>
         <View style={styles.button}>
           <Text style={styles.text}>Open {this.props.url}</Text>
         </View>
       </TouchableOpacity>
     );
   }
 });

 var IntentAndroidExample = React.createClass({

   statics: {
     title: 'Linking',
     description: 'Shows how to use Linking to open URLs.',
   },

   render: function() {
     return (
       <View>
         <OpenURLButton url={'https://www.facebook.com'} />
       </View>
     );
   },
 });

 var styles = StyleSheet.create({
   container: {
     flex: 1,
     backgroundColor: 'white',
     padding: 10,
     paddingTop: 30,
   },
   button: {
     padding: 10,
     backgroundColor: '#3B5998',
     marginBottom: 10,
   },
   text: {
     color: 'white',
   },
 });

 AppRegistry.registerComponent('demo3', () => IntentAndroidExample);
