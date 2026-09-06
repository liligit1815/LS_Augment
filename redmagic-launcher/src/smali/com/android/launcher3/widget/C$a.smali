.class public Lcom/android/launcher3/widget/C$a;
.super Lcom/android/launcher3/widget/picker/T$c;
.source "ComponentsListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/C;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private final h:Lcom/android/launcher3/util/T0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/widget/picker/T$c;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/util/T0;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/android/launcher3/util/T0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/widget/C$a;->h:Lcom/android/launcher3/util/T0;

    .line 10
    .line 11
    return-void
.end method

.method private b(Lm2/g;Lm2/g;)I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/C$a;->h:Lcom/android/launcher3/util/T0;

    .line 2
    .line 3
    iget-object v0, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->pinyinFull:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, p2, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->pinyinFull:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/util/T0;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    iget-object p0, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 21
    .line 22
    iget-object p2, p2, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 23
    .line 24
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 25
    .line 26
    invoke-virtual {p0, p2}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    :cond_1
    iget-object p0, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 37
    .line 38
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    const/4 p0, -0x1

    .line 49
    return p0

    .line 50
    :cond_2
    const/4 p0, 0x1

    .line 51
    return p0
.end method


# virtual methods
.method public a(Lm2/g;Lm2/g;)I
    .locals 4

    .line 1
    iget v0, p1, Lm2/g;->d:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, -0x1

    .line 5
    if-lez v0, :cond_4

    .line 6
    .line 7
    iget v3, p2, Lm2/g;->d:I

    .line 8
    .line 9
    if-lez v3, :cond_4

    .line 10
    .line 11
    iget-object v0, p1, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Lf1/d;->k(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v3, p2, Lm2/g;->a:Lcom/android/launcher3/model/data/B;

    .line 20
    .line 21
    iget-object v3, v3, Lcom/android/launcher3/model/data/B;->k:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v3}, Lf1/d;->k(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    if-nez v3, :cond_0

    .line 30
    .line 31
    return v2

    .line 32
    :cond_0
    if-nez v0, :cond_1

    .line 33
    .line 34
    if-eqz v3, :cond_1

    .line 35
    .line 36
    return v1

    .line 37
    :cond_1
    invoke-virtual {p1}, Lm2/g;->e()Lz1/Z4;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget v0, v0, Lz1/Z4;->i:I

    .line 42
    .line 43
    invoke-virtual {p2}, Lm2/g;->e()Lz1/Z4;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget v1, v1, Lz1/Z4;->i:I

    .line 48
    .line 49
    invoke-virtual {p1}, Lm2/g;->e()Lz1/Z4;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    iget v2, v2, Lz1/Z4;->j:I

    .line 54
    .line 55
    invoke-virtual {p2}, Lm2/g;->e()Lz1/Z4;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    iget v3, v3, Lz1/Z4;->j:I

    .line 60
    .line 61
    if-eq v2, v3, :cond_2

    .line 62
    .line 63
    sub-int/2addr v2, v3

    .line 64
    return v2

    .line 65
    :cond_2
    if-eq v0, v1, :cond_3

    .line 66
    .line 67
    sub-int/2addr v0, v1

    .line 68
    return v0

    .line 69
    :cond_3
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/C$a;->b(Lm2/g;Lm2/g;)I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    return p0

    .line 74
    :cond_4
    if-lez v0, :cond_5

    .line 75
    .line 76
    return v2

    .line 77
    :cond_5
    iget v0, p2, Lm2/g;->d:I

    .line 78
    .line 79
    if-lez v0, :cond_6

    .line 80
    .line 81
    return v1

    .line 82
    :cond_6
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/C$a;->b(Lm2/g;Lm2/g;)I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lm2/g;

    .line 2
    .line 3
    check-cast p2, Lm2/g;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/C$a;->a(Lm2/g;Lm2/g;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
