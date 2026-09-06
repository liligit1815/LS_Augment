.class Lcom/google/android/material/bottomsheet/a$e;
.super Lcom/google/android/material/bottomsheet/BottomSheetBehavior$g;
.source "BottomSheetDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/bottomsheet/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/google/android/material/bottomsheet/a;


# direct methods
.method constructor <init>(Lcom/google/android/material/bottomsheet/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/bottomsheet/a$e;->a:Lcom/google/android/material/bottomsheet/a;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$g;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Landroid/view/View;F)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Landroid/view/View;I)V
    .locals 0

    .line 1
    const/4 p1, 0x5

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/google/android/material/bottomsheet/a$e;->a:Lcom/google/android/material/bottomsheet/a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/a;->cancel()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method
