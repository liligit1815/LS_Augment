.class Landroidx/fragment/app/F$d;
.super Landroidx/fragment/app/w;
.source "FragmentManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/fragment/app/F;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic b:Landroidx/fragment/app/F;


# direct methods
.method constructor <init>(Landroidx/fragment/app/F;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/fragment/app/F$d;->b:Landroidx/fragment/app/F;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/fragment/app/w;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroidx/fragment/app/n;
    .locals 1

    .line 1
    iget-object p1, p0, Landroidx/fragment/app/F$d;->b:Landroidx/fragment/app/F;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/fragment/app/F;->w0()Landroidx/fragment/app/x;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Landroidx/fragment/app/F$d;->b:Landroidx/fragment/app/F;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/F;->w0()Landroidx/fragment/app/x;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroidx/fragment/app/x;->h()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p1, p0, p2, v0}, Landroidx/fragment/app/u;->b(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroidx/fragment/app/n;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method
