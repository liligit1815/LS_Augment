.class public final synthetic Ln1/w;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Ln1/x;


# direct methods
.method public synthetic constructor <init>(Ln1/x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ln1/w;->g:Ln1/x;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ln1/w;->g:Ln1/x;

    .line 2
    .line 3
    invoke-static {p0}, Ln1/x;->a(Ln1/x;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
