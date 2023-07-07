class Video {
 String _name;
 String _description;
 String _image;
 Video(this._name, this._description, this._image);
 @override
 String toString() {
 return _name;
 }
 String get name {
 return _name;
 }
 String get image {
 return _image;
 }
 String get description {
 return _description;
 }
}
