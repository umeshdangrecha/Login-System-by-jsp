function myFunction() {
    let x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " activeIcon";
    } else {
        x.className = "topnav";
    }
}

