.class Lcom/android/launcher3/cloudfolder/RemoteView$f;
.super Ljava/lang/Object;
.source "RemoteView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/cloudfolder/RemoteView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "f"
.end annotation


# instance fields
.field private a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/util/SparseArray<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$f;->a:Ljava/util/HashMap;

    return-void
.end method

.method synthetic constructor <init>(Ld1/h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/cloudfolder/RemoteView$f;-><init>()V

    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/cloudfolder/RemoteView$f;)Ljava/util/HashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$f;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method
