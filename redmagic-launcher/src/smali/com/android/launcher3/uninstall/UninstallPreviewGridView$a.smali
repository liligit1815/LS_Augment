.class Lcom/android/launcher3/uninstall/UninstallPreviewGridView$a;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "UninstallPreviewGridView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/uninstall/UninstallPreviewGridView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field private a:Lcom/android/launcher3/BubbleTextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f0b0493

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/android/launcher3/uninstall/UninstallPreviewGridView$a;->a:Lcom/android/launcher3/BubbleTextView;

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    invoke-virtual {p1, p0}, Lcom/android/launcher3/BubbleTextView;->setForceHideDot(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/uninstall/UninstallPreviewGridView$a;)Lcom/android/launcher3/BubbleTextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/uninstall/UninstallPreviewGridView$a;->a:Lcom/android/launcher3/BubbleTextView;

    .line 2
    .line 3
    return-object p0
.end method
