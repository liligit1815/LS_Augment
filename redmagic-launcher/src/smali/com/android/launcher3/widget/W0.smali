.class public Lcom/android/launcher3/widget/W0;
.super Ljava/lang/Object;
.source "WidgetItemComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lz1/Z4;",
        ">;"
    }
.end annotation


# instance fields
.field private final g:Landroid/os/UserHandle;

.field private final h:Ljava/text/Collator;

.field private i:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/android/launcher3/widget/W0;->g:Landroid/os/UserHandle;

    .line 9
    .line 10
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/android/launcher3/widget/W0;->h:Ljava/text/Collator;

    .line 15
    .line 16
    return-void
.end method

.method private c(Landroid/content/ComponentName;)I
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/widget/W0;->i:Landroid/util/ArrayMap;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->q0()Landroid/util/ArrayMap;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/android/launcher3/widget/W0;->i:Landroid/util/ArrayMap;

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/W0;->i:Landroid/util/ArrayMap;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/launcher3/widget/W0;->i:Landroid/util/ArrayMap;

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    check-cast p0, Ljava/lang/Integer;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    return p0

    .line 60
    :cond_1
    const p0, 0x7fffffff

    .line 61
    .line 62
    .line 63
    return p0
.end method


# virtual methods
.method public a(Lz1/Z4;Lz1/Z4;)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/W0;->g:Landroid/os/UserHandle;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    xor-int/lit8 v1, v0, 0x1

    .line 10
    .line 11
    iget-object v2, p0, Lcom/android/launcher3/widget/W0;->g:Landroid/os/UserHandle;

    .line 12
    .line 13
    iget-object v3, p2, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 14
    .line 15
    invoke-virtual {v2, v3}, Landroid/os/UserHandle;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x1

    .line 20
    xor-int/2addr v2, v3

    .line 21
    xor-int/2addr v1, v2

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    return v3

    .line 27
    :cond_0
    const/4 p0, -0x1

    .line 28
    return p0

    .line 29
    :cond_1
    iget-object v0, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 30
    .line 31
    iget-object v1, p2, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 32
    .line 33
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/widget/W0;->b(Landroid/content/ComponentName;Landroid/content/ComponentName;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    return v0

    .line 40
    :cond_2
    iget v0, p1, Lz1/Z4;->i:I

    .line 41
    .line 42
    iget v1, p1, Lz1/Z4;->j:I

    .line 43
    .line 44
    mul-int/2addr v1, v0

    .line 45
    iget v2, p2, Lz1/Z4;->i:I

    .line 46
    .line 47
    iget v3, p2, Lz1/Z4;->j:I

    .line 48
    .line 49
    mul-int/2addr v3, v2

    .line 50
    if-eq v1, v3, :cond_3

    .line 51
    .line 52
    invoke-static {v1, v3}, Ljava/lang/Integer;->compare(II)I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    return p0

    .line 57
    :cond_3
    if-lt v0, v2, :cond_5

    .line 58
    .line 59
    if-le v0, v2, :cond_4

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/widget/W0;->h:Ljava/text/Collator;

    .line 63
    .line 64
    iget-object p1, p1, Lz1/Z4;->g:Ljava/lang/String;

    .line 65
    .line 66
    iget-object p2, p2, Lz1/Z4;->g:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p0, p1, p2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    return p0

    .line 73
    :cond_5
    :goto_0
    invoke-static {v0, v2}, Ljava/lang/Integer;->compare(II)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    return p0
.end method

.method public b(Landroid/content/ComponentName;Landroid/content/ComponentName;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/W0;->c(Landroid/content/ComponentName;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-direct {p0, p2}, Lcom/android/launcher3/widget/W0;->c(Landroid/content/ComponentName;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p1, p0}, Ljava/lang/Integer;->compare(II)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lz1/Z4;

    .line 2
    .line 3
    check-cast p2, Lz1/Z4;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/widget/W0;->a(Lz1/Z4;Lz1/Z4;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
