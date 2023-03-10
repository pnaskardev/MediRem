import 'package:flutter/material.dart';
import 'package:medi_rem/models/medicine.dart';

class MedicineCard extends StatelessWidget 
{
  final Medicine med;
  const MedicineCard({super.key,required this.med});

  @override
  Widget build(BuildContext context) 
  {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card
      (
        elevation: 5,
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: 
          [
            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: 
              [
                Flexible
                (
                  child: Text
                  (
                    med.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ),
                Flexible
                (
                  child: Text
                  (
                    med.freq.toString()+' Times',
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                )
              ],
            ),
            const SizedBox
            (
              height: 15,
            ),
            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: 
              [
                Flexible
                (
                  child: Text
                  (
                    med.description??'No description provided',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ),
                Flexible
                (
                  child: Text
                  (
                    'days:-'+med.days.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                )
              ],

            ),
            const SizedBox
            (
              height: 15,
            ),
            Row
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              [
                Flexible
                (
                  child: GridView.builder
                  (
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
                    (
                      crossAxisCount: 2,
                    ),
                    itemCount: med.timeList.length,
                    itemBuilder: (BuildContext context,int index)
                    {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Chip
                        (
                          label:Text(med.timeList[index].toString()),
                          // deleteIcon: const Icon(Icons.delete), 
                          // onDeleted: ()
                          // {
                            
                          // },
                        ),
                      );
                    }
                  ),
                ),
                Flexible
                (
                  child: ElevatedButton.icon
                  (
                    onPressed: (){} ,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Time to remind'),
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}