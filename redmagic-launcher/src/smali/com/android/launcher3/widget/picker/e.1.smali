.class public Lcom/android/launcher3/widget/picker/e;
.super Ljava/lang/Object;
.source "WidgetRecommendationCategoryProvider.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static a(I)Lcom/android/launcher3/widget/picker/d;
    .locals 3

    .line 1
    const/4 v0, 0x7

    .line 2
    if-ne p0, v0, :cond_0

    .line 3
    .line 4
    new-instance p0, Lcom/android/launcher3/widget/picker/d;

    .line 5
    .line 6
    const v0, 0x7f14030b

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/widget/picker/d;-><init>(II)V

    .line 11
    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 v0, 0x5

    .line 15
    const/4 v1, 0x1

    .line 16
    if-ne p0, v0, :cond_1

    .line 17
    .line 18
    new-instance p0, Lcom/android/launcher3/widget/picker/d;

    .line 19
    .line 20
    const v0, 0x7f1402c1

    .line 21
    .line 22
    .line 23
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/widget/picker/d;-><init>(II)V

    .line 24
    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    const/4 v0, 0x3

    .line 28
    const/4 v2, 0x4

    .line 29
    if-ne p0, v2, :cond_2

    .line 30
    .line 31
    new-instance p0, Lcom/android/launcher3/widget/picker/d;

    .line 32
    .line 33
    const v1, 0x7f140402

    .line 34
    .line 35
    .line 36
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/widget/picker/d;-><init>(II)V

    .line 37
    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_2
    if-eq p0, v1, :cond_4

    .line 41
    .line 42
    const/4 v1, 0x2

    .line 43
    if-eq p0, v1, :cond_4

    .line 44
    .line 45
    if-ne p0, v0, :cond_3

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_3
    new-instance p0, Lcom/android/launcher3/widget/picker/d;

    .line 49
    .line 50
    const v0, 0x7f1402da

    .line 51
    .line 52
    .line 53
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/widget/picker/d;-><init>(II)V

    .line 54
    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_4
    :goto_0
    new-instance p0, Lcom/android/launcher3/widget/picker/d;

    .line 58
    .line 59
    const v0, 0x7f14019a

    .line 60
    .line 61
    .line 62
    invoke-direct {p0, v0, v2}, Lcom/android/launcher3/widget/picker/d;-><init>(II)V

    .line 63
    .line 64
    .line 65
    return-object p0
.end method


# virtual methods
.method public b(Landroid/content/Context;Lz1/Z4;)Lcom/android/launcher3/widget/picker/d;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->d()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p2, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/widget/U;->g()Landroid/content/ComponentName;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    new-instance p0, Lcom/android/launcher3/util/k;

    .line 15
    .line 16
    iget-object v0, p2, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/widget/U;->g()Landroid/content/ComponentName;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object p2, p2, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 27
    .line 28
    invoke-virtual {p2}, Lcom/android/launcher3/widget/U;->e()Landroid/os/UserHandle;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-direct {p0, p1, v0, p2}, Lcom/android/launcher3/util/k;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/util/k;->h()Landroid/content/pm/ApplicationInfo;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    iget p0, p0, Landroid/content/pm/ApplicationInfo;->category:I

    .line 42
    .line 43
    invoke-static {p0}, Lcom/android/launcher3/widget/picker/e;->a(I)Lcom/android/launcher3/widget/picker/d;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_0
    const/4 p0, 0x0

    .line 49
    return-object p0
.end method
