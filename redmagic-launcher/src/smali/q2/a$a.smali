.class public final Lq2/a$a;
.super Ljava/lang/Object;
.source "WidgetPreviewContainerSize.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lq2/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lq2/a$a;-><init>()V

    return-void
.end method

.method private final a(Ljava/util/List;ILz1/Z4;)Lq2/a;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lq2/a;",
            ">;I",
            "Lz1/Z4;",
            ")",
            "Lq2/a;"
        }
    .end annotation

    .line 1
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lq2/a;

    .line 6
    .line 7
    iget v0, p3, Lz1/Z4;->i:I

    .line 8
    .line 9
    int-to-float v0, v0

    .line 10
    iget v1, p3, Lz1/Z4;->j:I

    .line 11
    .line 12
    int-to-float v1, v1

    .line 13
    div-float/2addr v0, v1

    .line 14
    const v1, 0x7f7fffff    # Float.MAX_VALUE

    .line 15
    .line 16
    .line 17
    :goto_0
    invoke-static {p1}, Li4/m;->l(Ljava/util/List;)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-gt p2, v2, :cond_1

    .line 22
    .line 23
    invoke-static {p1, p3, p2}, Lq2/a$a;->b(Ljava/util/List;Lz1/Z4;I)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Lq2/a;

    .line 34
    .line 35
    iget v3, v2, Lq2/a;->a:I

    .line 36
    .line 37
    int-to-float v3, v3

    .line 38
    iget v2, v2, Lq2/a;->b:I

    .line 39
    .line 40
    int-to-float v2, v2

    .line 41
    div-float/2addr v3, v2

    .line 42
    sub-float v2, v0, v3

    .line 43
    .line 44
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    cmpg-float v3, v2, v1

    .line 49
    .line 50
    if-gez v3, :cond_0

    .line 51
    .line 52
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Lq2/a;

    .line 57
    .line 58
    move v1, v2

    .line 59
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    return-object p0
.end method

.method private static final b(Ljava/util/List;Lz1/Z4;I)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lq2/a;",
            ">;",
            "Lz1/Z4;",
            "I)Z"
        }
    .end annotation

    .line 1
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lq2/a;

    .line 6
    .line 7
    iget p2, p0, Lq2/a;->a:I

    .line 8
    .line 9
    iget v0, p1, Lz1/Z4;->i:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-gt p2, v0, :cond_0

    .line 14
    .line 15
    iget v3, p0, Lq2/a;->b:I

    .line 16
    .line 17
    iget v4, p1, Lz1/Z4;->j:I

    .line 18
    .line 19
    if-gt v3, v4, :cond_0

    .line 20
    .line 21
    move v3, v2

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move v3, v1

    .line 24
    :goto_0
    iget p1, p1, Lz1/Z4;->j:I

    .line 25
    .line 26
    iget p0, p0, Lq2/a;->b:I

    .line 27
    .line 28
    sub-int/2addr p1, p0

    .line 29
    if-gt p1, v2, :cond_1

    .line 30
    .line 31
    sub-int/2addr v0, p2

    .line 32
    if-gt v0, v2, :cond_1

    .line 33
    .line 34
    move p0, v2

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move p0, v1

    .line 37
    :goto_1
    if-eqz v3, :cond_2

    .line 38
    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    return v2

    .line 42
    :cond_2
    return v1
.end method


# virtual methods
.method public final c(Lz1/Z4;Lcom/android/launcher3/h0;)Lq2/a;
    .locals 9

    .line 1
    const-string v0, "item"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "dp"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-boolean v0, p2, Lcom/android/launcher3/h0;->G0:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-boolean p2, p2, Lcom/android/launcher3/h0;->K0:Z

    .line 16
    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lq2/b;->b()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-static {}, Lq2/b;->a()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    :goto_0
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x0

    .line 33
    move v2, v1

    .line 34
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_3

    .line 39
    .line 40
    add-int/lit8 v3, v2, 0x1

    .line 41
    .line 42
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    check-cast v4, Lq2/a;

    .line 47
    .line 48
    iget v5, v4, Lq2/a;->a:I

    .line 49
    .line 50
    iget v6, p1, Lz1/Z4;->i:I

    .line 51
    .line 52
    if-ne v5, v6, :cond_1

    .line 53
    .line 54
    iget v7, v4, Lq2/a;->b:I

    .line 55
    .line 56
    iget v8, p1, Lz1/Z4;->j:I

    .line 57
    .line 58
    if-ne v7, v8, :cond_1

    .line 59
    .line 60
    return-object v4

    .line 61
    :cond_1
    if-gt v5, v6, :cond_2

    .line 62
    .line 63
    iget v4, v4, Lq2/a;->b:I

    .line 64
    .line 65
    iget v5, p1, Lz1/Z4;->j:I

    .line 66
    .line 67
    if-gt v4, v5, :cond_2

    .line 68
    .line 69
    invoke-static {p2}, Li4/m;->E0(Ljava/lang/Iterable;)Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-direct {p0, p2, v2, p1}, Lq2/a$a;->a(Ljava/util/List;ILz1/Z4;)Lq2/a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0

    .line 78
    :cond_2
    move v2, v3

    .line 79
    goto :goto_1

    .line 80
    :cond_3
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    check-cast p0, Lq2/a;

    .line 85
    .line 86
    return-object p0
.end method
