.class public final synthetic Ls1/J;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Ls1/P;


# direct methods
.method public synthetic constructor <init>(Ls1/P;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ls1/J;->g:Ls1/P;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/J;->g:Ls1/P;

    .line 2
    .line 3
    invoke-static {p0}, Ls1/P;->j0(Ls1/P;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
