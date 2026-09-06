.class Lcom/android/launcher3/popup/P$p$a;
.super Ljava/lang/Object;
.source "SystemShortcut.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/popup/P$p;->Q(Ljava/lang/String;Ljava/lang/String;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/C2;

.field final synthetic h:Ljava/util/ArrayList;

.field final synthetic i:Lcom/android/launcher3/popup/P$p;


# direct methods
.method constructor <init>(Lcom/android/launcher3/popup/P$p;Lcom/android/launcher3/C2;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/popup/P$p$a;->i:Lcom/android/launcher3/popup/P$p;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/popup/P$p$a;->g:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/popup/P$p$a;->h:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/popup/P$p$a;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->K1()Lcom/android/launcher3/anim/G;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Lcom/android/launcher3/popup/P$p$a;->g:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->K1()Lcom/android/launcher3/anim/G;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iget-object v0, p0, Lcom/android/launcher3/popup/P$p$a;->i:Lcom/android/launcher3/popup/P$p;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/android/launcher3/popup/P;->mOriginalView:Landroid/view/View;

    .line 18
    .line 19
    new-instance v1, Lcom/android/launcher3/popup/P$p$a$a;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Lcom/android/launcher3/popup/P$p$a$a;-><init>(Lcom/android/launcher3/popup/P$p$a;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2, v0, v1}, Lcom/android/launcher3/anim/G;->f(Landroid/view/View;Landroid/animation/AnimatorListenerAdapter;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object p2, p0, Lcom/android/launcher3/popup/P$p$a;->g:Lcom/android/launcher3/C2;

    .line 29
    .line 30
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    iget-object v0, p0, Lcom/android/launcher3/popup/P$p$a;->g:Lcom/android/launcher3/C2;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/launcher3/popup/P$p$a;->h:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/android/launcher3/Workspace;->E2(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 39
    .line 40
    .line 41
    :goto_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 42
    .line 43
    .line 44
    return-void
.end method
