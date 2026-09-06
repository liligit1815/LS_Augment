.class Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar$a;
.super Ljava/lang/Object;
.source "Snackbar.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;->a0(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/View$OnClickListener;

.field final synthetic h:Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;


# direct methods
.method constructor <init>(Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;Landroid/view/View$OnClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar$a;->h:Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar$a;->g:Landroid/view/View$OnClickListener;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar$a;->g:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar$a;->h:Lcom/android/launcher3/mfvUtil/customsnackbar/Snackbar;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/mfvUtil/customsnackbar/BaseTransientBottomBar;->t(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
