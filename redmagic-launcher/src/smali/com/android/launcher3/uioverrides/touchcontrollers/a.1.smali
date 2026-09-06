.class public Lcom/android/launcher3/uioverrides/touchcontrollers/a;
.super Ljava/lang/Object;
.source "CreatTouchController.java"


# direct methods
.method public static a(Ljava/util/ArrayList;Lcom/android/launcher3/C2;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/util/G2;",
            ">;",
            "Lcom/android/launcher3/C2;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/globalsearch/r;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "CreatTouchController"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v0, v0, Lcom/android/launcher3/r4;->q:I

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    if-ne v0, v2, :cond_0

    .line 21
    .line 22
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/B;

    .line 23
    .line 24
    invoke-direct {v0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/B;-><init>(Lcom/android/launcher3/C2;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    const-string p0, "This is ZTE Phone and the slid-to-open-search switch is open, add SearchTouchController!"

    .line 31
    .line 32
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->O0:Z

    .line 41
    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    new-instance v0, Lcom/android/launcher3/uioverrides/touchcontrollers/C;

    .line 45
    .line 46
    invoke-direct {v0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/C;-><init>(Lcom/android/launcher3/C2;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    const-string p0, "This is ZTE Phone and the slid-to-open-search switch is closed, add StatusBarTouchController!"

    .line 53
    .line 54
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method
