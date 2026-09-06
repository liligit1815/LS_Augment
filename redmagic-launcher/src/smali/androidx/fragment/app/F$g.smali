.class Landroidx/fragment/app/F$g;
.super Ljava/lang/Object;
.source "FragmentManager.java"

# interfaces
.implements Landroidx/fragment/app/J;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/fragment/app/F;->m(Landroidx/fragment/app/x;Landroidx/fragment/app/u;Landroidx/fragment/app/n;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroidx/fragment/app/n;

.field final synthetic h:Landroidx/fragment/app/F;


# direct methods
.method constructor <init>(Landroidx/fragment/app/F;Landroidx/fragment/app/n;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/fragment/app/F$g;->h:Landroidx/fragment/app/F;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/fragment/app/F$g;->g:Landroidx/fragment/app/n;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Landroidx/fragment/app/F;Landroidx/fragment/app/n;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/F$g;->g:Landroidx/fragment/app/n;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroidx/fragment/app/n;->onAttachFragment(Landroidx/fragment/app/n;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
