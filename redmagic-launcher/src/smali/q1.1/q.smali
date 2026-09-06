.class public Lq1/q;
.super Ljava/lang/Object;
.source "HotseatPredictionModel.java"


# direct methods
.method public static synthetic a(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)Landroid/app/prediction/AppTargetEvent;
    .locals 1

    .line 1
    invoke-static {p0, p1}, Lz1/i4;->a(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)Landroid/app/prediction/AppTarget;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    invoke-static {p0, v0, p1}, Lz1/i4;->e(Landroid/app/prediction/AppTarget;ILcom/android/launcher3/model/data/y;)Landroid/app/prediction/AppTargetEvent;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public static b(Landroid/content/Context;Lz1/y0;)Landroid/os/Bundle;
    .locals 4

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    new-instance v2, Lq1/n;

    .line 13
    .line 14
    invoke-direct {v2}, Lq1/n;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Lq1/o;

    .line 22
    .line 23
    invoke-direct {v2, p0}, Lq1/o;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Lq1/p;

    .line 31
    .line 32
    invoke-direct {v2}, Lq1/p;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    new-instance v2, Lcom/android/launcher3/q2;

    .line 40
    .line 41
    invoke-direct {v2}, Lcom/android/launcher3/q2;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {v2}, Ljava/util/stream/Collectors;->toCollection(Ljava/util/function/Supplier;)Ljava/util/stream/Collector;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Ljava/util/ArrayList;

    .line 53
    .line 54
    new-instance v2, Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .line 58
    .line 59
    iget-object p1, p1, Lz1/y0;->b:Lcom/android/launcher3/util/A0;

    .line 60
    .line 61
    const/16 v3, -0x67

    .line 62
    .line 63
    invoke-virtual {p1, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, Lz1/y0$c;

    .line 68
    .line 69
    if-eqz p1, :cond_1

    .line 70
    .line 71
    iget-object p1, p1, Lz1/y0$c;->b:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    if-eqz v3, :cond_1

    .line 82
    .line 83
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 88
    .line 89
    invoke-static {p0, v3}, Lz1/i4;->a(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)Landroid/app/prediction/AppTarget;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    if-eqz v3, :cond_0

    .line 94
    .line 95
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_1
    const-string p0, "pin_events"

    .line 100
    .line 101
    invoke-virtual {v0, p0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 102
    .line 103
    .line 104
    const-string p0, "current_items"

    .line 105
    .line 106
    invoke-virtual {v0, p0, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 107
    .line 108
    .line 109
    return-object v0
.end method
