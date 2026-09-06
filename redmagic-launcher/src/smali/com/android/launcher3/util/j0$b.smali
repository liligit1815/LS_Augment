.class final Lcom/android/launcher3/util/j0$b;
.super Ljava/lang/Object;
.source "EventLogArray.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/util/j0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "b"
.end annotation


# instance fields
.field private a:I

.field private b:Ljava/lang/String;

.field private c:F

.field private d:J

.field private e:I


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


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/j0$b;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/j0$b;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/j0$b;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public final d()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/util/j0$b;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final e()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/j0$b;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public final f(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/util/j0$b;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public final g(ILjava/lang/String;F)V
    .locals 1

    .line 1
    const-string v0, "event"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput p1, p0, Lcom/android/launcher3/util/j0$b;->a:I

    .line 7
    .line 8
    iput-object p2, p0, Lcom/android/launcher3/util/j0$b;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput p3, p0, Lcom/android/launcher3/util/j0$b;->c:F

    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide p1

    .line 16
    iput-wide p1, p0, Lcom/android/launcher3/util/j0$b;->d:J

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    iput p1, p0, Lcom/android/launcher3/util/j0$b;->e:I

    .line 20
    .line 21
    return-void
.end method
