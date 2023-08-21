public void simpleSort (int[] a) {
    for(int i = 0; i < a.length; i++) {
        for(int j = i+1; j < a.length; j++) {
            if (a[i] > a[j]) {
                swap(a, i, j);
            }
        }
    }
}