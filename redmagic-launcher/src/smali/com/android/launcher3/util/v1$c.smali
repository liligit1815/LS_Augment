.class public Lcom/android/launcher3/util/v1$c;
.super Ljava/lang/Object;
.source "MultiPropertyFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/util/v1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field private final a:I

.field private final b:F

.field private c:F

.field final synthetic d:Lcom/android/launcher3/util/v1;


# direct methods
.method constructor <init>(Lcom/android/launcher3/util/v1;IF)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/util/v1$c;->d:Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/util/v1$c;->a:I

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/util/v1$c;->b:F

    .line 9
    .line 10
    iput p3, p0, Lcom/android/launcher3/util/v1$c;->c:F

    .line 11
    .line 12
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/util/v1$c;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/v1$c;->c:F

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public b(F)Landroid/animation/Animator;
    .locals 4

    .line 1
    sget-object v0, Lcom/android/launcher3/util/v1;->MULTI_PROPERTY_VALUE:Landroid/util/FloatProperty;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    new-array v2, v1, [F

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    aput p1, v2, v3

    .line 8
    .line 9
    invoke-static {p0, v0, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, v1}, Landroid/animation/ObjectAnimator;->setAutoCancel(Z)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public c()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/v1$c;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public d(F)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/v1$c;->d:Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/util/v1;->c(Lcom/android/launcher3/util/v1;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lcom/android/launcher3/util/v1$c;->a:I

    .line 8
    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/util/v1$c;->d:Lcom/android/launcher3/util/v1;

    .line 12
    .line 13
    iget v1, p0, Lcom/android/launcher3/util/v1$c;->b:F

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/android/launcher3/util/v1;->e(Lcom/android/launcher3/util/v1;F)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/util/v1$c;->d:Lcom/android/launcher3/util/v1;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/android/launcher3/util/v1;->d(Lcom/android/launcher3/util/v1;)[Lcom/android/launcher3/util/v1$c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    array-length v1, v0

    .line 25
    const/4 v2, 0x0

    .line 26
    :goto_0
    if-ge v2, v1, :cond_1

    .line 27
    .line 28
    aget-object v3, v0, v2

    .line 29
    .line 30
    iget v4, v3, Lcom/android/launcher3/util/v1$c;->a:I

    .line 31
    .line 32
    iget v5, p0, Lcom/android/launcher3/util/v1$c;->a:I

    .line 33
    .line 34
    if-eq v4, v5, :cond_0

    .line 35
    .line 36
    iget-object v4, p0, Lcom/android/launcher3/util/v1$c;->d:Lcom/android/launcher3/util/v1;

    .line 37
    .line 38
    invoke-static {v4}, Lcom/android/launcher3/util/v1;->b(Lcom/android/launcher3/util/v1;)Lcom/android/launcher3/util/v1$b;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    iget-object v6, p0, Lcom/android/launcher3/util/v1$c;->d:Lcom/android/launcher3/util/v1;

    .line 43
    .line 44
    invoke-static {v6}, Lcom/android/launcher3/util/v1;->a(Lcom/android/launcher3/util/v1;)F

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    iget v3, v3, Lcom/android/launcher3/util/v1$c;->c:F

    .line 49
    .line 50
    invoke-interface {v5, v6, v3}, Lcom/android/launcher3/util/v1$b;->a(FF)F

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    invoke-static {v4, v3}, Lcom/android/launcher3/util/v1;->e(Lcom/android/launcher3/util/v1;F)V

    .line 55
    .line 56
    .line 57
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/util/v1$c;->d:Lcom/android/launcher3/util/v1;

    .line 61
    .line 62
    iget v1, p0, Lcom/android/launcher3/util/v1$c;->a:I

    .line 63
    .line 64
    invoke-static {v0, v1}, Lcom/android/launcher3/util/v1;->f(Lcom/android/launcher3/util/v1;I)V

    .line 65
    .line 66
    .line 67
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/util/v1$c;->d:Lcom/android/launcher3/util/v1;

    .line 68
    .line 69
    invoke-static {v0}, Lcom/android/launcher3/util/v1;->b(Lcom/android/launcher3/util/v1;)Lcom/android/launcher3/util/v1$b;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget-object v1, p0, Lcom/android/launcher3/util/v1$c;->d:Lcom/android/launcher3/util/v1;

    .line 74
    .line 75
    invoke-static {v1}, Lcom/android/launcher3/util/v1;->a(Lcom/android/launcher3/util/v1;)F

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    invoke-interface {v0, v1, p1}, Lcom/android/launcher3/util/v1$b;->a(FF)F

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iput p1, p0, Lcom/android/launcher3/util/v1$c;->c:F

    .line 84
    .line 85
    iget-object p0, p0, Lcom/android/launcher3/util/v1$c;->d:Lcom/android/launcher3/util/v1;

    .line 86
    .line 87
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->apply(F)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/v1$c;->c:F

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
