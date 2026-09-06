.class public final synthetic LV1/w;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LV1/y;

.field public final synthetic h:Ljava/lang/Float;


# direct methods
.method public synthetic constructor <init>(LV1/y;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LV1/w;->g:LV1/y;

    .line 5
    .line 6
    iput-object p2, p0, LV1/w;->h:Ljava/lang/Float;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, LV1/w;->g:LV1/y;

    .line 2
    .line 3
    iget-object p0, p0, LV1/w;->h:Ljava/lang/Float;

    .line 4
    .line 5
    invoke-static {v0, p0}, LV1/y;->c(LV1/y;Ljava/lang/Float;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
