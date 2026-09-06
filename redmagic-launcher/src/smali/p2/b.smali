.class public final synthetic Lp2/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LI1/b;

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(LI1/b;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lp2/b;->g:LI1/b;

    .line 5
    .line 6
    iput-object p2, p0, Lp2/b;->h:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lp2/b;->i:Ljava/util/ArrayList;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lp2/b;->g:LI1/b;

    .line 2
    .line 3
    iget-object v1, p0, Lp2/b;->h:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lp2/b;->i:Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/launcher3/widget/picker/search/a;->d(LI1/b;Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
