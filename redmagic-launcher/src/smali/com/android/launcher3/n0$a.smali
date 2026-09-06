.class public Lcom/android/launcher3/n0$a;
.super Ljava/lang/Object;
.source "DropTarget.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/n0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:Z

.field public f:Lcom/android/launcher3/dragndrop/v;

.field public g:Lcom/android/launcher3/model/data/y;

.field public h:Lcom/android/launcher3/model/data/y;

.field public i:Lcom/android/launcher3/m0;

.field public j:Z

.field public k:Z

.field public l:LO0/e;

.field public m:Lcom/android/launcher3/dragndrop/y;

.field public final n:Lcom/android/launcher3/logging/d;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/android/launcher3/n0$a;->a:I

    .line 6
    .line 7
    iput p1, p0, Lcom/android/launcher3/n0$a;->b:I

    .line 8
    .line 9
    iput p1, p0, Lcom/android/launcher3/n0$a;->c:I

    .line 10
    .line 11
    iput p1, p0, Lcom/android/launcher3/n0$a;->d:I

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/android/launcher3/n0$a;->e:Z

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/n0$a;->h:Lcom/android/launcher3/model/data/y;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 24
    .line 25
    iput-boolean p1, p0, Lcom/android/launcher3/n0$a;->j:Z

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    iput-boolean p1, p0, Lcom/android/launcher3/n0$a;->k:Z

    .line 29
    .line 30
    iput-object v0, p0, Lcom/android/launcher3/n0$a;->m:Lcom/android/launcher3/dragndrop/y;

    .line 31
    .line 32
    new-instance p1, Lcom/android/launcher3/logging/f;

    .line 33
    .line 34
    invoke-direct {p1}, Lcom/android/launcher3/logging/f;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/android/launcher3/logging/f;->a()Lcom/android/launcher3/logging/d;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/android/launcher3/n0$a;->n:Lcom/android/launcher3/logging/d;

    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public final a([F)[F
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    new-array p1, v0, [F

    .line 5
    .line 6
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/android/launcher3/dragndrop/v;->getDragRegion()Landroid/graphics/Rect;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iget v2, p0, Lcom/android/launcher3/n0$a;->a:I

    .line 13
    .line 14
    iget v3, p0, Lcom/android/launcher3/n0$a;->c:I

    .line 15
    .line 16
    sub-int/2addr v2, v3

    .line 17
    iget v3, v1, Landroid/graphics/Rect;->left:I

    .line 18
    .line 19
    sub-int/2addr v2, v3

    .line 20
    iget v3, p0, Lcom/android/launcher3/n0$a;->b:I

    .line 21
    .line 22
    iget p0, p0, Lcom/android/launcher3/n0$a;->d:I

    .line 23
    .line 24
    sub-int/2addr v3, p0

    .line 25
    iget p0, v1, Landroid/graphics/Rect;->top:I

    .line 26
    .line 27
    sub-int/2addr v3, p0

    .line 28
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    div-int/2addr p0, v0

    .line 33
    add-int/2addr v2, p0

    .line 34
    int-to-float p0, v2

    .line 35
    const/4 v2, 0x0

    .line 36
    aput p0, p1, v2

    .line 37
    .line 38
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    div-int/2addr p0, v0

    .line 43
    add-int/2addr v3, p0

    .line 44
    int-to-float p0, v3

    .line 45
    const/4 v0, 0x1

    .line 46
    aput p0, p1, v0

    .line 47
    .line 48
    return-object p1
.end method
