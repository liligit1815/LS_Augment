.class Landroidx/fragment/app/n$h;
.super Ljava/lang/Object;
.source "Fragment.java"

# interfaces
.implements Lm/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/fragment/app/n;->registerForActivityResult(Ld/a;Lc/b;)Lc/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lm/a<",
        "Ljava/lang/Void;",
        "Lc/d;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Landroidx/fragment/app/n;


# direct methods
.method constructor <init>(Landroidx/fragment/app/n;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/fragment/app/n$h;->a:Landroidx/fragment/app/n;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Void;)Lc/d;
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/n$h;->a:Landroidx/fragment/app/n;

    .line 2
    .line 3
    iget-object p1, p0, Landroidx/fragment/app/n;->mHost:Landroidx/fragment/app/x;

    .line 4
    .line 5
    instance-of v0, p1, Lc/e;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p1, Lc/e;

    .line 10
    .line 11
    invoke-interface {p1}, Lc/e;->getActivityResultRegistry()Lc/d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/n;->requireActivity()Landroidx/fragment/app/s;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Landroidx/activity/h;->getActivityResultRegistry()Lc/d;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Void;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/fragment/app/n$h;->a(Ljava/lang/Void;)Lc/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
