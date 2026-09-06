.class public final synthetic Lcom/android/launcher3/util/w1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/util/y1;

.field public final synthetic b:Ljava/lang/Integer;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/util/y1;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/util/w1;->a:Lcom/android/launcher3/util/y1;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/util/w1;->b:Ljava/lang/Integer;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/w1;->a:Lcom/android/launcher3/util/y1;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/util/w1;->b:Ljava/lang/Integer;

    .line 4
    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/util/y1;->a(Lcom/android/launcher3/util/y1;Ljava/lang/Integer;Ljava/lang/Integer;)Lcom/android/launcher3/util/y1$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
