.class Lcom/android/launcher3/util/y1$a;
.super Landroid/util/FloatProperty;
.source "MultiScalePropertyFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/util/y1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/FloatProperty<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final a:I

.field private b:F

.field final synthetic c:Lcom/android/launcher3/util/y1;


# direct methods
.method constructor <init>(Lcom/android/launcher3/util/y1;ILjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/util/y1$a;->c:Lcom/android/launcher3/util/y1;

    .line 2
    .line 3
    invoke-direct {p0, p3}, Landroid/util/FloatProperty;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/high16 p1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    iput p1, p0, Lcom/android/launcher3/util/y1$a;->b:F

    .line 9
    .line 10
    iput p2, p0, Lcom/android/launcher3/util/y1$a;->a:I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/util/y1$a;Ljava/lang/Integer;Lcom/android/launcher3/util/y1$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/util/y1$a;->c(Ljava/lang/Integer;Lcom/android/launcher3/util/y1$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic c(Ljava/lang/Integer;Lcom/android/launcher3/util/y1$a;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget v0, p0, Lcom/android/launcher3/util/y1$a;->a:I

    .line 6
    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/util/y1$a;->c:Lcom/android/launcher3/util/y1;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/android/launcher3/util/y1;->e(Lcom/android/launcher3/util/y1;)F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget v1, p2, Lcom/android/launcher3/util/y1$a;->b:F

    .line 16
    .line 17
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {p1, v0}, Lcom/android/launcher3/util/y1;->k(Lcom/android/launcher3/util/y1;F)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/android/launcher3/util/y1$a;->c:Lcom/android/launcher3/util/y1;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/android/launcher3/util/y1;->d(Lcom/android/launcher3/util/y1;)F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget v1, p2, Lcom/android/launcher3/util/y1$a;->b:F

    .line 31
    .line 32
    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-static {p1, v0}, Lcom/android/launcher3/util/y1;->j(Lcom/android/launcher3/util/y1;F)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/util/y1$a;->c:Lcom/android/launcher3/util/y1;

    .line 40
    .line 41
    invoke-static {p0}, Lcom/android/launcher3/util/y1;->f(Lcom/android/launcher3/util/y1;)F

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iget p2, p2, Lcom/android/launcher3/util/y1$a;->b:F

    .line 46
    .line 47
    mul-float/2addr p1, p2

    .line 48
    invoke-static {p0, p1}, Lcom/android/launcher3/util/y1;->l(Lcom/android/launcher3/util/y1;F)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method


# virtual methods
.method public b(Landroid/view/View;)Ljava/lang/Float;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/lang/Float;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getScaleX()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d(Landroid/view/View;F)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;F)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/y1$a;->c:Lcom/android/launcher3/util/y1;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/util/y1;->c(Lcom/android/launcher3/util/y1;)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget v1, p0, Lcom/android/launcher3/util/y1$a;->a:I

    .line 12
    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/android/launcher3/util/y1$a;->c:Lcom/android/launcher3/util/y1;

    .line 16
    .line 17
    const v1, 0x7f7fffff    # Float.MAX_VALUE

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Lcom/android/launcher3/util/y1;->k(Lcom/android/launcher3/util/y1;F)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/util/y1$a;->c:Lcom/android/launcher3/util/y1;

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-static {v0, v1}, Lcom/android/launcher3/util/y1;->j(Lcom/android/launcher3/util/y1;F)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/util/y1$a;->c:Lcom/android/launcher3/util/y1;

    .line 30
    .line 31
    const/high16 v1, 0x3f800000    # 1.0f

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/android/launcher3/util/y1;->l(Lcom/android/launcher3/util/y1;F)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/util/y1$a;->c:Lcom/android/launcher3/util/y1;

    .line 37
    .line 38
    invoke-static {v0}, Lcom/android/launcher3/util/y1;->g(Lcom/android/launcher3/util/y1;)Landroid/util/ArrayMap;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Lcom/android/launcher3/util/x1;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Lcom/android/launcher3/util/x1;-><init>(Lcom/android/launcher3/util/y1$a;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/util/ArrayMap;->forEach(Ljava/util/function/BiConsumer;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/launcher3/util/y1$a;->c:Lcom/android/launcher3/util/y1;

    .line 51
    .line 52
    iget v1, p0, Lcom/android/launcher3/util/y1$a;->a:I

    .line 53
    .line 54
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v0, v1}, Lcom/android/launcher3/util/y1;->i(Lcom/android/launcher3/util/y1;Ljava/lang/Integer;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/util/y1$a;->c:Lcom/android/launcher3/util/y1;

    .line 62
    .line 63
    invoke-static {v0}, Lcom/android/launcher3/util/y1;->e(Lcom/android/launcher3/util/y1;)F

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-static {v0, p2}, Ljava/lang/Math;->min(FF)F

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget-object v1, p0, Lcom/android/launcher3/util/y1$a;->c:Lcom/android/launcher3/util/y1;

    .line 72
    .line 73
    invoke-static {v1}, Lcom/android/launcher3/util/y1;->d(Lcom/android/launcher3/util/y1;)F

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-static {v1, p2}, Ljava/lang/Math;->max(FF)F

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    iget-object v2, p0, Lcom/android/launcher3/util/y1$a;->c:Lcom/android/launcher3/util/y1;

    .line 82
    .line 83
    invoke-static {v2}, Lcom/android/launcher3/util/y1;->f(Lcom/android/launcher3/util/y1;)F

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    mul-float/2addr v2, p2

    .line 88
    iget-object v3, p0, Lcom/android/launcher3/util/y1$a;->c:Lcom/android/launcher3/util/y1;

    .line 89
    .line 90
    invoke-static {v2, v0, v1}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    invoke-static {v3, v0}, Lcom/android/launcher3/util/y1;->h(Lcom/android/launcher3/util/y1;F)V

    .line 95
    .line 96
    .line 97
    iput p2, p0, Lcom/android/launcher3/util/y1$a;->b:F

    .line 98
    .line 99
    iget-object p0, p0, Lcom/android/launcher3/util/y1$a;->c:Lcom/android/launcher3/util/y1;

    .line 100
    .line 101
    invoke-static {p0}, Lcom/android/launcher3/util/y1;->b(Lcom/android/launcher3/util/y1;)F

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/y1;->m(Landroid/view/View;F)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/y1$a;->b(Landroid/view/View;)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    check-cast p1, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/y1$a;->d(Landroid/view/View;F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/y1$a;->b:F

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
