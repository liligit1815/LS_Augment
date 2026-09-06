.class public final Lc1/s$b;
.super Ljava/lang/Object;
.source "ViewCluster.kt"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc1/s;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field private g:I

.field final synthetic h:Lc1/s;


# direct methods
.method public constructor <init>(Lc1/s;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lc1/s$b;->h:Lc1/s;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Landroid/view/View;)I
    .locals 1

    .line 1
    iget-object v0, p0, Lc1/s$b;->h:Lc1/s;

    .line 2
    .line 3
    invoke-virtual {v0}, Lc1/s;->e()Lc1/e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/android/launcher3/util/C;

    .line 14
    .line 15
    iget-object v0, p0, Lc1/s$b;->h:Lc1/s;

    .line 16
    .line 17
    invoke-virtual {v0}, Lc1/s;->e()Lc1/e;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v0, v0, Lc1/e;->e:Landroid/util/ArrayMap;

    .line 22
    .line 23
    invoke-virtual {v0, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    check-cast p2, Lcom/android/launcher3/util/C;

    .line 28
    .line 29
    if-eqz p1, :cond_4

    .line 30
    .line 31
    if-eqz p2, :cond_4

    .line 32
    .line 33
    iget p0, p0, Lc1/s$b;->g:I

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    if-eq p0, v0, :cond_3

    .line 37
    .line 38
    const/4 v0, 0x2

    .line 39
    if-eq p0, v0, :cond_2

    .line 40
    .line 41
    const/4 v0, 0x4

    .line 42
    if-eq p0, v0, :cond_1

    .line 43
    .line 44
    const/16 v0, 0x8

    .line 45
    .line 46
    if-eq p0, v0, :cond_0

    .line 47
    .line 48
    iget p0, p1, Lcom/android/launcher3/util/C;->b:I

    .line 49
    .line 50
    iget p1, p2, Lcom/android/launcher3/util/C;->b:I

    .line 51
    .line 52
    sub-int/2addr p0, p1

    .line 53
    return p0

    .line 54
    :cond_0
    iget p0, p1, Lcom/android/launcher3/util/C;->b:I

    .line 55
    .line 56
    iget p1, p2, Lcom/android/launcher3/util/C;->b:I

    .line 57
    .line 58
    sub-int/2addr p0, p1

    .line 59
    return p0

    .line 60
    :cond_1
    iget p0, p1, Lcom/android/launcher3/util/C;->a:I

    .line 61
    .line 62
    iget p1, p2, Lcom/android/launcher3/util/C;->a:I

    .line 63
    .line 64
    sub-int/2addr p0, p1

    .line 65
    return p0

    .line 66
    :cond_2
    iget p0, p2, Lcom/android/launcher3/util/C;->b:I

    .line 67
    .line 68
    iget p2, p2, Lcom/android/launcher3/util/C;->d:I

    .line 69
    .line 70
    add-int/2addr p0, p2

    .line 71
    iget p2, p1, Lcom/android/launcher3/util/C;->b:I

    .line 72
    .line 73
    iget p1, p1, Lcom/android/launcher3/util/C;->d:I

    .line 74
    .line 75
    add-int/2addr p2, p1

    .line 76
    sub-int/2addr p0, p2

    .line 77
    return p0

    .line 78
    :cond_3
    iget p0, p2, Lcom/android/launcher3/util/C;->a:I

    .line 79
    .line 80
    iget p2, p2, Lcom/android/launcher3/util/C;->c:I

    .line 81
    .line 82
    add-int/2addr p0, p2

    .line 83
    iget p2, p1, Lcom/android/launcher3/util/C;->a:I

    .line 84
    .line 85
    iget p1, p1, Lcom/android/launcher3/util/C;->c:I

    .line 86
    .line 87
    add-int/2addr p2, p1

    .line 88
    sub-int/2addr p0, p2

    .line 89
    return p0

    .line 90
    :cond_4
    const/4 p0, 0x0

    .line 91
    throw p0
.end method

.method public final b(I)V
    .locals 0

    .line 1
    iput p1, p0, Lc1/s$b;->g:I

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Landroid/view/View;

    .line 2
    .line 3
    check-cast p2, Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lc1/s$b;->a(Landroid/view/View;Landroid/view/View;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
