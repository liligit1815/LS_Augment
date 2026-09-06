.class public Lcom/android/launcher3/dragndrop/p;
.super Ljava/lang/Object;
.source "DragOptions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/dragndrop/p$a;
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Z

.field public c:Landroid/graphics/Point;

.field public d:Lcom/android/launcher3/dragndrop/p$a;

.field public e:F

.field public f:F

.field public g:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/dragndrop/p;->a:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/android/launcher3/dragndrop/p;->b:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/p;->c:Landroid/graphics/Point;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 13
    .line 14
    const/high16 v0, 0x3f800000    # 1.0f

    .line 15
    .line 16
    iput v0, p0, Lcom/android/launcher3/dragndrop/p;->f:F

    .line 17
    .line 18
    return-void
.end method
