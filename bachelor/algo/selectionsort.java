public void selectionSort (int[] a) {
    for(int i = 0; i < a.length; i++) {
        int small = i;
        for(int j = i+1; j < a.length; j++) {
            if(a[small] > a[j]) {
                small = j;
            }
        }
        swap(a, i, small);
    }
}