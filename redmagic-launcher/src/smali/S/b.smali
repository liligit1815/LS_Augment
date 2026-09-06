.class public final synthetic LS/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:LS/m;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;LS/m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LS/b;->g:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, LS/b;->h:LS/m;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, LS/b;->g:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, LS/b;->h:LS/m;

    .line 4
    .line 5
    invoke-static {v0, p0}, LS/c;->a(Ljava/lang/String;LS/m;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
