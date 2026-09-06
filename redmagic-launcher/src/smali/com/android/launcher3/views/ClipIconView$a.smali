.class Lcom/android/launcher3/views/ClipIconView$a;
.super Landroid/view/ViewOutlineProvider;
.source "ClipIconView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/views/ClipIconView;->i(Landroid/graphics/drawable/Drawable;ILandroid/view/ViewGroup$MarginLayoutParams;ZLcom/android/launcher3/h0;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/views/ClipIconView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/views/ClipIconView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/views/ClipIconView$a;->a:Lcom/android/launcher3/views/ClipIconView;

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
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/views/ClipIconView$a;->a:Lcom/android/launcher3/views/ClipIconView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/views/ClipIconView;->b(Lcom/android/launcher3/views/ClipIconView;)Landroid/graphics/Rect;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/android/launcher3/views/ClipIconView$a;->a:Lcom/android/launcher3/views/ClipIconView;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/views/ClipIconView;->c(Lcom/android/launcher3/views/ClipIconView;)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {p2, p1, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
