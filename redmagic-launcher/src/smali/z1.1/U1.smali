.class public final synthetic Lz1/U1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lz1/c2;

.field public final synthetic h:Lt1/n;


# direct methods
.method public synthetic constructor <init>(Lz1/c2;Lt1/n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/U1;->g:Lz1/c2;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/U1;->h:Lt1/n;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/U1;->g:Lz1/c2;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/U1;->h:Lt1/n;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lz1/c2;->j(Lz1/c2;Lt1/n;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
