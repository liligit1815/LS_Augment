.class public interface abstract Lcom/android/launcher3/util/Y0;
.super Ljava/lang/Object;
.source "LauncherBindableItemsContainer.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/Y0$a;
    }
.end annotation


# direct methods
.method private static P(ILcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 1

    .line 1
    const-string v0, "<unused var>"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget p1, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 9
    .line 10
    if-ne p1, p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public static synthetic d(ILcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/util/Y0;->P(ILcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static g(Ljava/util/Set;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 1

    .line 1
    const-string v0, "v"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    instance-of v0, p2, Lcom/android/launcher3/BubbleTextView;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    instance-of v0, p1, Lcom/android/launcher3/model/data/I;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 21
    .line 22
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 23
    .line 24
    invoke-virtual {p2, p1}, Lcom/android/launcher3/BubbleTextView;->y(Lcom/android/launcher3/model/data/I;)V

    .line 25
    .line 26
    .line 27
    goto/16 :goto_1

    .line 28
    .line 29
    :cond_0
    instance-of v0, p2, Lcom/android/launcher3/folder/FolderIcon;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    instance-of v0, p1, Lcom/android/launcher3/model/data/p;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    check-cast p2, Lcom/android/launcher3/folder/FolderIcon;

    .line 38
    .line 39
    new-instance p1, Lcom/android/launcher3/util/X0;

    .line 40
    .line 41
    invoke-direct {p1, p0}, Lcom/android/launcher3/util/X0;-><init>(Ljava/util/Set;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p2, p1}, Lcom/android/launcher3/folder/FolderIcon;->q0(Ljava/util/function/Predicate;)V

    .line 45
    .line 46
    .line 47
    goto/16 :goto_1

    .line 48
    .line 49
    :cond_1
    instance-of v0, p2, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 50
    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    instance-of v0, p1, Lcom/android/launcher3/model/data/l;

    .line 54
    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    check-cast p2, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 58
    .line 59
    new-instance p1, Lcom/android/launcher3/util/X0;

    .line 60
    .line 61
    invoke-direct {p1, p0}, Lcom/android/launcher3/util/X0;-><init>(Ljava/util/Set;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p2, p1}, Lcom/android/launcher3/apppairs/AppPairIcon;->i(Ljava/util/function/Predicate;)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    instance-of v0, p2, Lcom/android/launcher3/widget/F0;

    .line 69
    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    invoke-static {p0, p1}, Li4/m;->Q(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_3

    .line 77
    .line 78
    check-cast p2, Lcom/android/launcher3/widget/F0;

    .line 79
    .line 80
    invoke-virtual {p2}, Lcom/android/launcher3/widget/F0;->e0()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p2}, Lcom/android/launcher3/widget/F0;->j0()V

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_3
    invoke-static {}, Lcom/android/launcher3/widget/suggest/v;->B()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_6

    .line 92
    .line 93
    instance-of v0, p2, Lcom/android/launcher3/widget/T;

    .line 94
    .line 95
    if-eqz v0, :cond_6

    .line 96
    .line 97
    instance-of p1, p1, Lcom/android/launcher3/model/data/A;

    .line 98
    .line 99
    if-eqz p1, :cond_6

    .line 100
    .line 101
    instance-of p1, p2, Lcom/android/launcher3/widget/suggest/m;

    .line 102
    .line 103
    if-eqz p1, :cond_4

    .line 104
    .line 105
    move-object p1, p2

    .line 106
    check-cast p1, Lcom/android/launcher3/widget/suggest/m;

    .line 107
    .line 108
    invoke-virtual {p1, p0}, Lcom/android/launcher3/widget/suggest/m;->a1(Ljava/util/Set;)Z

    .line 109
    .line 110
    .line 111
    :cond_4
    check-cast p2, Lcom/android/launcher3/widget/T;

    .line 112
    .line 113
    invoke-virtual {p2}, Lcom/android/launcher3/widget/T;->getOtherWidgetHostViewList()Ljava/util/ArrayList;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    const-string p2, "getOtherWidgetHostViewList(...)"

    .line 118
    .line 119
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 123
    .line 124
    .line 125
    move-result p2

    .line 126
    if-nez p2, :cond_6

    .line 127
    .line 128
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    const-string p2, "iterator(...)"

    .line 133
    .line 134
    invoke-static {p1, p2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :cond_5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 138
    .line 139
    .line 140
    move-result p2

    .line 141
    if-eqz p2, :cond_6

    .line 142
    .line 143
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    const-string v0, "next(...)"

    .line 148
    .line 149
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    check-cast p2, Landroid/appwidget/AppWidgetHostView;

    .line 153
    .line 154
    instance-of v0, p2, Lcom/android/launcher3/widget/suggest/m;

    .line 155
    .line 156
    if-eqz v0, :cond_5

    .line 157
    .line 158
    check-cast p2, Lcom/android/launcher3/widget/suggest/m;

    .line 159
    .line 160
    invoke-virtual {p2, p0}, Lcom/android/launcher3/widget/suggest/m;->a1(Ljava/util/Set;)Z

    .line 161
    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_6
    :goto_1
    const/4 p0, 0x0

    .line 165
    return p0
.end method

.method public static synthetic o(Ljava/util/Set;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/util/Y0;->g(Ljava/util/Set;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private static s(Ljava/util/function/Predicate;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 1

    .line 1
    const-string v0, "<unused var>"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public static synthetic y(Ljava/util/function/Predicate;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/util/Y0;->s(Ljava/util/function/Predicate;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method


# virtual methods
.method public A(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;
    .locals 1

    .line 1
    const-string v0, "op"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0, p1}, Lcom/android/launcher3/util/Y0;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public varargs M([Ljava/util/function/Predicate;)Landroid/view/View;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)",
            "Landroid/view/View;"
        }
    .end annotation

    .line 1
    const-string v0, "matchers"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    array-length v0, p1

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    aget-object v2, p1, v1

    .line 11
    .line 12
    new-instance v3, Lcom/android/launcher3/util/V0;

    .line 13
    .line 14
    invoke-direct {v3, v2}, Lcom/android/launcher3/util/V0;-><init>(Ljava/util/function/Predicate;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p0, v3}, Lcom/android/launcher3/util/Y0;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-object v2

    .line 27
    :cond_1
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public abstract e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;
.end method

.method public m(Ljava/util/Set;Lcom/android/launcher3/views/k;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "+",
            "Lcom/android/launcher3/model/data/y;",
            ">;",
            "Lcom/android/launcher3/views/k;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "updates"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "context"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/util/W0;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Lcom/android/launcher3/util/W0;-><init>(Ljava/util/Set;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p0, v0}, Lcom/android/launcher3/util/Y0;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    invoke-static {p2}, Lcom/android/launcher3/folder/Folder;->i1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/folder/Folder;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/Folder;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public x(I)Landroid/view/View;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/U0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/launcher3/util/U0;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0, v0}, Lcom/android/launcher3/util/Y0;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
