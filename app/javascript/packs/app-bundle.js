import ReactOnRails from 'react-on-rails';

import Books from '../bundles/Books/components/Books';
import Chapters from '../bundles/Chapters/components/Chapters';
import Favorites from '../bundles/Favorites/components/Favorites';
 
// This is how react_on_rails can see the Chapters in the browser.
ReactOnRails.register({
	Books,
 	Chapters,
	Favorites
});
