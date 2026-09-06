.class LK1/g$a;
.super Ljava/lang/Object;
.source "DetachableClickListener.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnWindowAttachListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LK1/g;->b(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:LK1/g;


# direct methods
.method constructor <init>(LK1/g;)V
    .locals 0

    .line 1
    iput-object p1, p0, LK1/g$a;->a:LK1/g;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onWindowAttached()V
    .locals 0

    .line 1
    return-void
.end method

.method public onWindowDetached()V
    .locals 1

    .line 1
    iget-object p0, p0, LK1/g$a;->a:LK1/g;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, LK1/g;->a(LK1/g;Landroid/content/DialogInterface$OnClickListener;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
