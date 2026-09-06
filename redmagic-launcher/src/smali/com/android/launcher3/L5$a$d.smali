.class Lcom/android/launcher3/L5$a$d;
.super Ljava/lang/Object;
.source "SpringOverScroller.java"

# interfaces
.implements Landroidx/dynamicanimation/animation/e$r;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/L5$a;->x(IIIFI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/L5$a;


# direct methods
.method constructor <init>(Lcom/android/launcher3/L5$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/L5$a$d;->a:Lcom/android/launcher3/L5$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroidx/dynamicanimation/animation/e;FF)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/L5$a$d;->a:Lcom/android/launcher3/L5$a;

    .line 2
    .line 3
    invoke-static {p1, p2}, Lcom/android/launcher3/L5$a;->h(Lcom/android/launcher3/L5$a;F)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v0, "startScroll onAnimationUpdate v="

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p2, ", v1="

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p2, ", mCurrentPosition="

    .line 28
    .line 29
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/android/launcher3/L5$a$d;->a:Lcom/android/launcher3/L5$a;

    .line 33
    .line 34
    invoke-static {p0}, Lcom/android/launcher3/L5$a;->b(Lcom/android/launcher3/L5$a;)F

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "SpringOverScroller"

    .line 46
    .line 47
    invoke-static {p1, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    return-void
.end method
