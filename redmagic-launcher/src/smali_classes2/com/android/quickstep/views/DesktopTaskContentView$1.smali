.class public final Lcom/android/quickstep/views/DesktopTaskContentView$1;
.super Landroid/view/ViewOutlineProvider;
.source "DesktopTaskContentView.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/views/DesktopTaskContentView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/views/DesktopTaskContentView;


# direct methods
.method constructor <init>(Lcom/android/quickstep/views/DesktopTaskContentView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/DesktopTaskContentView$1;->this$0:Lcom/android/quickstep/views/DesktopTaskContentView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 1

    .line 1
    const-string v0, "view"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "outline"

    .line 7
    .line 8
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/quickstep/views/DesktopTaskContentView$1;->this$0:Lcom/android/quickstep/views/DesktopTaskContentView;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/android/quickstep/views/DesktopTaskContentView;->access$getBounds$p(Lcom/android/quickstep/views/DesktopTaskContentView;)Landroid/graphics/Rect;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p0, p0, Lcom/android/quickstep/views/DesktopTaskContentView$1;->this$0:Lcom/android/quickstep/views/DesktopTaskContentView;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/quickstep/views/DesktopTaskContentView;->getCornerRadius()F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-virtual {p2, p1, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
