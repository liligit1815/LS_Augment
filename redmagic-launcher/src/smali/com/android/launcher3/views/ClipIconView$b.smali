.class public Lcom/android/launcher3/views/ClipIconView$b;
.super Ljava/lang/Object;
.source "ClipIconView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/views/ClipIconView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final a:LI/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI/a<",
            "Landroid/graphics/Canvas;",
            ">;"
        }
    .end annotation
.end field

.field public final b:F

.field public final c:F

.field public final d:F

.field public final e:Z

.field public f:I

.field public g:F

.field public h:I

.field public i:I


# direct methods
.method public constructor <init>(LI/a;FFFZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI/a<",
            "Landroid/graphics/Canvas;",
            ">;FFFZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/views/ClipIconView$b;->a:LI/a;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/views/ClipIconView$b;->b:F

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/views/ClipIconView$b;->c:F

    .line 9
    .line 10
    iput p4, p0, Lcom/android/launcher3/views/ClipIconView$b;->d:F

    .line 11
    .line 12
    iput-boolean p5, p0, Lcom/android/launcher3/views/ClipIconView$b;->e:Z

    .line 13
    .line 14
    return-void
.end method
