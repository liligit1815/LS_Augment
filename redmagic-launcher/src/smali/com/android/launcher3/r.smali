.class public final synthetic Lcom/android/launcher3/r;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic a:Landroid/content/res/Resources;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Landroid/content/res/Resources;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/r;->a:Landroid/content/res/Resources;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/r;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/r;->a:Landroid/content/res/Resources;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/r;->b:I

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/launcher3/s;->a(Landroid/content/res/Resources;I)Lorg/xmlpull/v1/XmlPullParser;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
