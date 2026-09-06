.class public Lcom/android/launcher3/popup/t;
.super Ljava/lang/Object;
.source "PopupPopulator.java"


# static fields
.field private static final a:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Landroid/content/pm/ShortcutInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/popup/p;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/popup/p;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/popup/t;->a:Ljava/util/Comparator;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;Landroid/view/View;Landroid/content/ComponentName;Ljava/util/List;Landroid/os/Handler;Lcom/android/launcher3/popup/PopupContainerWithArrow;)V
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/util/k;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/android/launcher3/util/k;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, LN1/f;

    .line 7
    .line 8
    invoke-direct {p1, p0, p2}, LN1/f;-><init>(Landroid/content/Context;Landroid/os/UserHandle;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/widget/group/h;->e()Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    instance-of p2, p3, Lcom/android/launcher3/widget/group/b;

    .line 19
    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    const/4 p2, 0x1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move p2, v1

    .line 25
    :goto_0
    if-eqz p2, :cond_1

    .line 26
    .line 27
    invoke-virtual {p4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p4

    .line 31
    invoke-virtual {p1, p4}, LN1/f;->a(Ljava/lang/String;)LN1/f;

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    invoke-virtual {p1, p4}, LN1/f;->e(Landroid/content/ComponentName;)LN1/f;

    .line 36
    .line 37
    .line 38
    :goto_1
    const/16 p4, 0x9

    .line 39
    .line 40
    invoke-virtual {p1, p4}, LN1/f;->d(I)LN1/f$a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance p4, Lz1/y0$a;

    .line 49
    .line 50
    invoke-direct {p4}, Lz1/y0$a;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-interface {p1, p4}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 58
    .line 59
    .line 60
    move-result-object p4

    .line 61
    invoke-interface {p1, p4}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Ljava/util/List;

    .line 66
    .line 67
    if-eqz p2, :cond_2

    .line 68
    .line 69
    instance-of p2, p3, Lcom/android/launcher3/widget/group/b;

    .line 70
    .line 71
    if-eqz p2, :cond_2

    .line 72
    .line 73
    check-cast p3, Lcom/android/launcher3/widget/group/b;

    .line 74
    .line 75
    invoke-virtual {p3, p1}, Lcom/android/launcher3/widget/group/b;->j0(Ljava/util/List;)Ljava/util/ArrayList;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    goto :goto_2

    .line 80
    :cond_2
    invoke-static {p1}, Lcom/android/launcher3/popup/t;->f(Ljava/util/List;)Ljava/util/List;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    :goto_2
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-virtual {p2}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    :goto_3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 93
    .line 94
    .line 95
    move-result p3

    .line 96
    if-ge v1, p3, :cond_3

    .line 97
    .line 98
    invoke-interface {p5}, Ljava/util/List;->size()I

    .line 99
    .line 100
    .line 101
    move-result p3

    .line 102
    if-ge v1, p3, :cond_3

    .line 103
    .line 104
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p3

    .line 108
    check-cast p3, Landroid/content/pm/ShortcutInfo;

    .line 109
    .line 110
    new-instance p4, Lcom/android/launcher3/model/data/I;

    .line 111
    .line 112
    invoke-direct {p4, p3, p0}, Lcom/android/launcher3/model/data/I;-><init>(Landroid/content/pm/ShortcutInfo;Landroid/content/Context;)V

    .line 113
    .line 114
    .line 115
    new-instance v2, Ls1/h;

    .line 116
    .line 117
    invoke-direct {v2, p3, v0}, Ls1/h;-><init>(Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/util/k;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p2, p4, v2}, Ls1/P;->B0(Lcom/android/launcher3/model/data/z;Ls1/h;)V

    .line 121
    .line 122
    .line 123
    iput v1, p4, Lcom/android/launcher3/model/data/y;->rank:I

    .line 124
    .line 125
    const/16 v2, -0x6b

    .line 126
    .line 127
    iput v2, p4, Lcom/android/launcher3/model/data/y;->container:I

    .line 128
    .line 129
    invoke-interface {p5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    check-cast v2, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 134
    .line 135
    new-instance v3, Lcom/android/launcher3/popup/s;

    .line 136
    .line 137
    invoke-direct {v3, v2, p4, p3, p7}, Lcom/android/launcher3/popup/s;-><init>(Lcom/android/launcher3/shortcuts/DeepShortcutView;Lcom/android/launcher3/model/data/I;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/popup/PopupContainerWithArrow;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p6, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 141
    .line 142
    .line 143
    add-int/lit8 v1, v1, 0x1

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_3
    return-void
.end method

.method public static synthetic b(Landroid/content/pm/ShortcutInfo;Landroid/content/pm/ShortcutInfo;)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->isDeclaredInManifest()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->isDeclaredInManifest()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, -0x1

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->isDeclaredInManifest()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->isDeclaredInManifest()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_1
    invoke-virtual {p0}, Landroid/content/pm/ShortcutInfo;->getRank()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-virtual {p1}, Landroid/content/pm/ShortcutInfo;->getRank()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-static {p0, p1}, Ljava/lang/Integer;->compare(II)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0
.end method

.method public static synthetic c()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/shortcuts/DeepShortcutView;Lcom/android/launcher3/model/data/I;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/popup/PopupContainerWithArrow;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->d(Lcom/android/launcher3/model/data/I;Landroid/content/pm/ShortcutInfo;Lcom/android/launcher3/popup/PopupContainerWithArrow;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static e(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/os/Handler;Lcom/android/launcher3/popup/PopupContainerWithArrow;Ljava/util/List;Landroid/view/View;)Ljava/lang/Runnable;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/content/Context;",
            ":",
            "Lcom/android/launcher3/views/k;",
            ">(TT;",
            "Lcom/android/launcher3/model/data/y;",
            "Landroid/os/Handler;",
            "Lcom/android/launcher3/popup/PopupContainerWithArrow;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/shortcuts/DeepShortcutView;",
            ">;",
            "Landroid/view/View;",
            ")",
            "Ljava/lang/Runnable;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object v5

    .line 5
    iget-object v3, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    new-instance p0, Lcom/android/launcher3/popup/q;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/android/launcher3/popup/q;-><init>()V

    .line 16
    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    new-instance v0, Lcom/android/launcher3/popup/r;

    .line 20
    .line 21
    move-object v1, p0

    .line 22
    move-object v7, p2

    .line 23
    move-object v8, p3

    .line 24
    move-object v6, p4

    .line 25
    move-object v4, p5

    .line 26
    invoke-direct/range {v0 .. v8}, Lcom/android/launcher3/popup/r;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;Landroid/view/View;Landroid/content/ComponentName;Ljava/util/List;Landroid/os/Handler;Lcom/android/launcher3/popup/PopupContainerWithArrow;)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method public static f(Ljava/util/List;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/content/pm/ShortcutInfo;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/content/pm/ShortcutInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/launcher3/popup/t;->a:Ljava/util/Comparator;

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x4

    .line 11
    if-gt v0, v1, :cond_0

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/4 v3, 0x0

    .line 24
    move v4, v3

    .line 25
    :goto_0
    if-ge v3, v2, :cond_3

    .line 26
    .line 27
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    check-cast v5, Landroid/content/pm/ShortcutInfo;

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v6

    .line 37
    if-ge v6, v1, :cond_1

    .line 38
    .line 39
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    invoke-virtual {v5}, Landroid/content/pm/ShortcutInfo;->isDynamic()Z

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    if-eqz v5, :cond_2

    .line 47
    .line 48
    add-int/lit8 v4, v4, 0x1

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    invoke-virtual {v5}, Landroid/content/pm/ShortcutInfo;->isDynamic()Z

    .line 52
    .line 53
    .line 54
    move-result v7

    .line 55
    if-eqz v7, :cond_2

    .line 56
    .line 57
    const/4 v7, 0x2

    .line 58
    if-ge v4, v7, :cond_2

    .line 59
    .line 60
    add-int/lit8 v4, v4, 0x1

    .line 61
    .line 62
    sub-int/2addr v6, v4

    .line 63
    invoke-interface {v0, v6}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    return-object v0
.end method
