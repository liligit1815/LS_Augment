.class public final synthetic LO0/n;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LO0/r;

.field public final synthetic h:Lcom/android/launcher3/model/data/y;


# direct methods
.method public synthetic constructor <init>(LO0/r;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LO0/n;->g:LO0/r;

    .line 5
    .line 6
    iput-object p2, p0, LO0/n;->h:Lcom/android/launcher3/model/data/y;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, LO0/n;->g:LO0/r;

    .line 2
    .line 3
    iget-object p0, p0, LO0/n;->h:Lcom/android/launcher3/model/data/y;

    .line 4
    .line 5
    invoke-static {v0, p0}, LO0/r;->j(LO0/r;Lcom/android/launcher3/model/data/y;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
