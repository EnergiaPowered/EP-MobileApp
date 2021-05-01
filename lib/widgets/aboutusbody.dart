import 'package:energia_app/models/aboutus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutUsBody extends StatelessWidget {
  Widget get seperator => Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: double.infinity,
          height: 2,
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white38, Colors.white, Colors.white38])),
          ),
        ),
      );

  Widget title(String title) {
    return Row(children: [
      Container(
        margin: EdgeInsets.all(8.0),
        height: 10,
        width: 10,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
      ),
      Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var aboutObj = Provider.of<About>(context);
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Know more about us",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .merge(TextStyle(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            title("WHO ARE WE ?"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                aboutObj.whoAreWe,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            seperator,
            title("OUR VISION"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                aboutObj.vision,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            seperator,
            title("OUR MISSION"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                aboutObj.mission,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            seperator,
            if (aboutObj.structureUrl != null) title("OUR STRUCTURE"),
            if (aboutObj.structureUrl != null)
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    aboutObj.structureUrl,
                    filterQuality: FilterQuality.medium,
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height / 2,
                    width: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  )),
          ],
        ),
      ),
    );
  }
}
