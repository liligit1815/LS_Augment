.class Lcom/google/android/material/tabs/e$i$a;
.super Ljava/lang/Object;
.source "TabLayout.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/tabs/e$i;->f(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/View;

.field final synthetic h:Lcom/google/android/material/tabs/e$i;


# direct methods
.method constructor <init>(Lcom/google/android/material/tabs/e$i;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/tabs/e$i$a;->h:Lcom/google/android/material/tabs/e$i;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/google/android/material/tabs/e$i$a;->g:Landroid/view/View;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/google/android/material/tabs/e$i$a;->g:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/google/android/material/tabs/e$i$a;->h:Lcom/google/android/material/tabs/e$i;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/google/android/material/tabs/e$i$a;->g:Landroid/view/View;

    .line 12
    .line 13
    invoke-static {p1, p0}, Lcom/google/android/material/tabs/e$i;->a(Lcom/google/android/material/tabs/e$i;Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
