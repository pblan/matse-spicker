public void insertionSort(int[] a) {
    for (int i = 0; i < a.length; i++) {
        int m = a[i];

        // fuer alle Elemente links vom aktuellen Element
        for(int j = i; j > 0; j--) {
            if (a[j-1] <= m) {
                break;
            }

            // groessere Elemente nach hinten schieben 
            a[j] = a[j-1];
        }

        // m an freiem Platz einfuegen
        a[j] = m;
    }
}