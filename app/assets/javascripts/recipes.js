function addIngredientField() {

  //create Date object
  var date = new Date();

  //get number of milliseconds since midnight Jan 1, 1970 and use it for id
  var mSec = date.getTime(); 

  // Replace 0 with milliseconds
  idAttributQuantity =  "recipe_ingredients_attributes_0_quantity".replace("0", mSec);
  nameAttributQuantity =  "recipe[ingredients_attributes][0][quantity]".replace("0", mSec);

  idAttributName =  "recipe_ingredients_attributes_0_name".replace("0", mSec);
  nameAttributName =  "recipe[ingredients_attributes][0][name]".replace("0", mSec);
 
  // <li> tag
  var li = document.createElement("li");

  labelQuantity.setAttribute("for", idAttributQuantity);
  labelQuantity.appendChild(quantityLabelText);
  li.appendChild(labelQuantity);

  inputQuantity.setAttribute("type", "text");
  inputQuantity.setAttribute("id", idAttributQuantity);
  inputQuantity.setAttribute("name", nameAttributQuantity);
  li.appendChild(inputQuantity);

  labelName.setAttribute("for", idAttributName);
  labelName.appendChild(nameLabelText);
  li.appendChild(labelName);

  inputName.setAttribute("type", "text");
  inputName.setAttribute("id", idAttributName);
  inputName.setAttribute("name", nameAttributName);
  li.appendChild(inputName);

  //add created elements to myList
  document.getElementById("myList").appendChild(li);

  //show address header
  $("#ingredientHeader").show(); 
}