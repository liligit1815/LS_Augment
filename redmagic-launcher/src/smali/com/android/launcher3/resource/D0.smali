.class public final synthetic Lcom/android/launcher3/resource/D0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/resource/D0;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/resource/D0;->b:Ljava/util/ArrayList;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/D0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/resource/D0;->b:Ljava/util/ArrayList;

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/resource/h1$h;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/resource/h1;->h(Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/android/launcher3/resource/h1$h;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
