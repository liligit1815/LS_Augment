.class public final synthetic LD1/s;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# instance fields
.field public final synthetic g:LD1/t;

.field public final synthetic h:Ljava/util/function/BiConsumer;


# direct methods
.method public synthetic constructor <init>(LD1/t;Ljava/util/function/BiConsumer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LD1/s;->g:LD1/t;

    .line 5
    .line 6
    iput-object p2, p0, LD1/s;->h:Ljava/util/function/BiConsumer;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 1

    .line 1
    iget-object v0, p0, LD1/s;->g:LD1/t;

    .line 2
    .line 3
    iget-object p0, p0, LD1/s;->h:Ljava/util/function/BiConsumer;

    .line 4
    .line 5
    invoke-static {v0, p0}, LD1/t;->c(LD1/t;Ljava/util/function/BiConsumer;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
