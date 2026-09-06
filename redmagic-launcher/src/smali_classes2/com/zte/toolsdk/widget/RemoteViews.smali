.class public Lcom/zte/toolsdk/widget/RemoteViews;
.super Ljava/lang/Object;
.source "RemoteViews.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteInputsAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetIntTagAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$Action;,
        Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteViewsAdapterIntent;,
        Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;,
        Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;,
        Lcom/zte/toolsdk/widget/RemoteViews$MethodArgs;,
        Lcom/zte/toolsdk/widget/RemoteViews$ActionException;,
        Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;,
        Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetDrawableTint;,
        Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;,
        Lcom/zte/toolsdk/widget/RemoteViews$ViewContentNavigation;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetEmptyView;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetPendingIntentTemplate;,
        Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$TextViewSizeAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$ViewPaddingAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$BitmapReflectionAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetRippleDrawableColor;,
        Lcom/zte/toolsdk/widget/RemoteViews$RemoveFromParentAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$ComplexUnitDimensionReflectionAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetCompoundButtonCheckedAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetRadioGroupCheckedAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetViewOutlinePreferredRadiusAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;,
        Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetOnStylusHandwritingResponse;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetOnSeekBarChangeResponse;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetOnGroupExpandResponse;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetOnGroupCollapseResponse;,
        Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;,
        Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;,
        Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;,
        Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;,
        Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;,
        Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;,
        Lcom/zte/toolsdk/widget/RemoteViews$RemoteViewsContextWrapper;,
        Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;,
        Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;,
        Lcom/zte/toolsdk/widget/RemoteViews$RemoteView;,
        Lcom/zte/toolsdk/widget/RemoteViews$ViewTree;,
        Lcom/zte/toolsdk/widget/RemoteViews$RemoteViewOutlineProvider;,
        Lcom/zte/toolsdk/widget/RemoteViews$RunnableAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$RuntimeAction;,
        Lcom/zte/toolsdk/widget/RemoteViews$ApplyFlags;,
        Lcom/zte/toolsdk/widget/RemoteViews$MarginType;
    }
.end annotation


# static fields
.field private static final ACTION_NOOP:Lcom/zte/toolsdk/widget/RemoteViews$Action;

.field private static final ALTERNATIVE_DEFAULT:Landroid/os/Parcel$ReadWriteHelper;

.field private static final ATTRIBUTE_REFLECTION_ACTION_TAG:I = 0x20

.field private static final BITMAP_REFLECTION_ACTION_TAG:I = 0xc

.field private static final COMPLEX_UNIT_DIMENSION_REFLECTION_ACTION_TAG:I = 0x19

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/zte/toolsdk/widget/RemoteViews;",
            ">;"
        }
    .end annotation
.end field

.field private static final DEBUG:Z = false

.field private static final DEFAULT_INTERACTION_HANDLER:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

.field public static final EXTRA_CHECKED:Ljava/lang/String; = "android.widget.extra.CHECKED"

.field public static final EXTRA_GROUP_COLLAPSE:Ljava/lang/String; = "android.widget.extra.GROUP_COLLAPSE"

.field public static final EXTRA_GROUP_EXPAND:Ljava/lang/String; = "android.widget.extra.GROUP_EXPAND"

.field public static final EXTRA_LONG_CLICK:Ljava/lang/String; = "android.widget.extra.LONG_CLICK"

.field public static final EXTRA_PROGRESS:Ljava/lang/String; = "android.widget.extra.PROGRESS"

.field static final EXTRA_REMOTEADAPTER_APPWIDGET_ID:Ljava/lang/String; = "remoteAdapterAppWidgetId"

.field static final EXTRA_REMOTEADAPTER_ON_LIGHT_BACKGROUND:Ljava/lang/String; = "remoteAdapterOnLightBackground"

.field public static final EXTRA_SHARED_ELEMENT_BOUNDS:Ljava/lang/String; = "android.widget.extra.SHARED_ELEMENT_BOUNDS"

.field public static final EXTRA_STOP_TRACK:Ljava/lang/String; = "android.widget.extra.STOP_TRACK"

.field static final FLAG_MASK_TO_PROPAGATE:I = 0x6

.field public static final FLAG_REAPPLY_DISALLOWED:I = 0x1

.field public static final FLAG_USE_LIGHT_BACKGROUND_LAYOUT:I = 0x4

.field public static final FLAG_WIDGET_IS_COLLECTION_CHILD:I = 0x2

.field private static final INFLATER_FILTER:Landroid/view/LayoutInflater$Filter;

.field private static final LAYOUT_PARAM_ACTION_TAG:I = 0x13

.field private static final LOG_TAG:Ljava/lang/String; = "RemoteViews"

.field public static final MARGIN_BOTTOM:I = 0x3

.field public static final MARGIN_END:I = 0x5

.field public static final MARGIN_LEFT:I = 0x0

.field public static final MARGIN_RIGHT:I = 0x2

.field public static final MARGIN_START:I = 0x4

.field public static final MARGIN_TOP:I = 0x1

.field private static final MAX_ADAPTER_CONVERSION_WAITING_TIME_MS:I = 0x4e20

.field private static final MAX_INIT_VIEW_COUNT:I = 0x10

.field private static final MAX_NESTED_VIEWS:I = 0xa

.field private static final MAX_SINGLE_PARCEL_SIZE:I = 0xc3500

.field private static final MODE_HAS_LANDSCAPE_AND_PORTRAIT:I = 0x1

.field private static final MODE_HAS_SIZED_REMOTEVIEWS:I = 0x2

.field private static final MODE_NORMAL:I = 0x0

.field private static final NIGHT_MODE_REFLECTION_ACTION_TAG:I = 0x1e

.field private static final REFLECTION_ACTION_TAG:I = 0x2

.field private static final REMOVE_FROM_PARENT_ACTION_TAG:I = 0x17

.field private static final RESOURCE_REFLECTION_ACTION_TAG:I = 0x18

.field private static final SET_COMPOUND_BUTTON_CHECKED_TAG:I = 0x1a

.field private static final SET_DRAWABLE_TINT_TAG:I = 0x3

.field private static final SET_DRAW_INSTRUCTION_TAG:I = 0x23

.field private static final SET_EMPTY_VIEW_ACTION_TAG:I = 0x6

.field private static final SET_INT_TAG_TAG:I = 0x16

.field private static final SET_ON_CHECKED_CHANGE_RESPONSE_TAG:I = 0x1d

.field private static final SET_ON_CLICK_RESPONSE_TAG:I = 0x1

.field private static final SET_ON_GROUP_COLLAPSE_TAG:I = 0x27

.field private static final SET_ON_GROUP_EXPAND_TAG:I = 0x26

.field private static final SET_ON_LONG_CLICK_RESPONSE_TAG:I = 0x28

.field private static final SET_ON_SEEK_RESPONSE_TAG:I = 0x24

.field private static final SET_ON_STYLUS_HANDWRITING_RESPONSE_TAG:I = 0x22

.field private static final SET_PENDING_INTENT_TEMPLATE_TAG:I = 0x8

.field private static final SET_RADIO_GROUP_CHECKED:I = 0x1b

.field private static final SET_REMOTE_ADAPTER_TAG:I = 0x21

.field private static final SET_REMOTE_COLLECTION_ITEMS_ADAPTER_TAG:I = 0x1f

.field private static final SET_REMOTE_EXPANDABLE_LIST_ADAPTER_TAG:I = 0x25

.field private static final SET_REMOTE_INPUTS_ACTION_TAG:I = 0x12

.field private static final SET_REMOTE_VIEW_ADAPTER_INTENT_TAG:I = 0xa

.field private static final SET_RIPPLE_DRAWABLE_COLOR_TAG:I = 0x15

.field private static final SET_VIEW_OUTLINE_RADIUS_TAG:I = 0x1c

.field private static final TEXT_VIEW_DRAWABLE_ACTION_TAG:I = 0xb

.field private static final TEXT_VIEW_SIZE_ACTION_TAG:I = 0xd

.field static final VALUE_TYPE_ATTRIBUTE:I = 0x4

.field static final VALUE_TYPE_COMPLEX_UNIT:I = 0x2

.field static final VALUE_TYPE_RAW:I = 0x1

.field static final VALUE_TYPE_RESOURCE:I = 0x3

.field private static final VIEW_CONTENT_NAVIGATION_TAG:I = 0x5

.field private static final VIEW_GROUP_ACTION_ADD_TAG:I = 0x4

.field private static final VIEW_GROUP_ACTION_REMOVE_TAG:I = 0x7

.field private static final VIEW_PADDING_ACTION_TAG:I = 0xe

.field private static final sLookupKey:Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;

.field private static final sMethods:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;",
            "Lcom/zte/toolsdk/widget/RemoteViews$MethodArgs;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mActions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/zte/toolsdk/widget/RemoteViews$Action;",
            ">;"
        }
    .end annotation
.end field

.field public mApplication:Landroid/content/pm/ApplicationInfo;

.field private mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

.field private mApplyFlags:I

.field private mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

.field private mClassCookies:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

.field private mFillInIntent:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private mHasDrawInstructions:Z

.field private mIdealSize:Landroid/util/SizeF;

.field private mIsRoot:Z

.field private mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

.field private mLayoutId:I

.field private mLayoutInflaterFactory2:Landroid/view/LayoutInflater$Factory2;

.field private mLightBackgroundLayoutId:I

.field private mPendingIntentTemplate:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/app/PendingIntent;",
            ">;"
        }
    .end annotation
.end field

.field private mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

.field private mProviderInstanceId:J

.field private mSizedRemoteViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/zte/toolsdk/widget/RemoteViews;",
            ">;"
        }
    .end annotation
.end field

.field private mViewId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/os/Parcel$ReadWriteHelper;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Parcel$ReadWriteHelper;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/zte/toolsdk/widget/RemoteViews;->ALTERNATIVE_DEFAULT:Landroid/os/Parcel$ReadWriteHelper;

    .line 7
    .line 8
    new-instance v0, Lcom/zte/toolsdk/widget/d;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/zte/toolsdk/widget/d;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/zte/toolsdk/widget/RemoteViews;->INFLATER_FILTER:Landroid/view/LayoutInflater$Filter;

    .line 14
    .line 15
    new-instance v0, Lcom/zte/toolsdk/widget/e;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/zte/toolsdk/widget/e;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/zte/toolsdk/widget/RemoteViews;->DEFAULT_INTERACTION_HANDLER:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 21
    .line 22
    new-instance v0, Landroid/util/ArrayMap;

    .line 23
    .line 24
    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/zte/toolsdk/widget/RemoteViews;->sMethods:Landroid/util/ArrayMap;

    .line 28
    .line 29
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;

    .line 30
    .line 31
    invoke-direct {v0}, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;-><init>()V

    .line 32
    .line 33
    .line 34
    sput-object v0, Lcom/zte/toolsdk/widget/RemoteViews;->sLookupKey:Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;

    .line 35
    .line 36
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$1;

    .line 37
    .line 38
    invoke-direct {v0}, Lcom/zte/toolsdk/widget/RemoteViews$1;-><init>()V

    .line 39
    .line 40
    .line 41
    sput-object v0, Lcom/zte/toolsdk/widget/RemoteViews;->ACTION_NOOP:Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 42
    .line 43
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$2;

    .line 44
    .line 45
    invoke-direct {v0}, Lcom/zte/toolsdk/widget/RemoteViews$2;-><init>()V

    .line 46
    .line 47
    .line 48
    sput-object v0, Lcom/zte/toolsdk/widget/RemoteViews;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 49
    .line 50
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 89
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    .line 90
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    invoke-direct {v1}, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;-><init>()V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 91
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    invoke-direct {v1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 92
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    invoke-direct {v1}, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;-><init>()V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    const/4 v1, 0x1

    .line 93
    iput-boolean v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    const/4 v1, 0x0

    .line 94
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 95
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 96
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 97
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIdealSize:Landroid/util/SizeF;

    .line 98
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    const/4 v0, -0x1

    .line 99
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    const-wide/16 v0, -0x1

    .line 100
    iput-wide v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mProviderInstanceId:J

    return-void
.end method

.method protected constructor <init>(Landroid/content/pm/ApplicationInfo;I)V
    .locals 4

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    .line 7
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    invoke-direct {v1}, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;-><init>()V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 8
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    invoke-direct {v1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 9
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    invoke-direct {v1}, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;-><init>()V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    const/4 v2, 0x1

    .line 10
    iput-boolean v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    const/4 v2, 0x0

    .line 11
    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 12
    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 13
    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 14
    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIdealSize:Landroid/util/SizeF;

    .line 15
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    const/4 v0, -0x1

    .line 16
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    const-wide/16 v2, -0x1

    .line 17
    iput-wide v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mProviderInstanceId:J

    .line 18
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 19
    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLayoutId:I

    .line 20
    invoke-virtual {v1, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;->put(Landroid/content/pm/ApplicationInfo;)V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 101
    invoke-direct {p0, p1, v0, v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Landroid/os/Parcel;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;Landroid/content/pm/ApplicationInfo;I)V

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;Landroid/content/pm/ApplicationInfo;I)V
    .locals 5

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 119
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    .line 120
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    invoke-direct {v1}, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;-><init>()V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 121
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    invoke-direct {v1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 122
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    invoke-direct {v1}, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;-><init>()V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    const/4 v1, 0x1

    .line 123
    iput-boolean v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    const/4 v2, 0x0

    .line 124
    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 125
    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 126
    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 127
    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIdealSize:Landroid/util/SizeF;

    .line 128
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    const/4 v3, -0x1

    .line 129
    iput v3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    const-wide/16 v3, -0x1

    .line 130
    iput-wide v3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mProviderInstanceId:J

    const/16 v3, 0xa

    if-le p4, v3, :cond_1

    .line 131
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v3

    invoke-static {v3}, Landroid/os/UserHandle;->getAppId(I)I

    move-result v3

    const/16 v4, 0x3e8

    if-ne v3, v4, :cond_0

    goto :goto_0

    .line 132
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Too many nested views."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_0
    add-int/2addr p4, v1

    .line 133
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-nez p2, :cond_2

    .line 134
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    invoke-direct {p2, p1}, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;-><init>(Landroid/os/Parcel;)V

    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 135
    invoke-virtual {p1}, Landroid/os/Parcel;->copyClassCookies()Ljava/util/Map;

    move-result-object p2

    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mClassCookies:Ljava/util/Map;

    .line 136
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    invoke-direct {p2, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V

    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    goto :goto_1

    .line 137
    :cond_2
    invoke-direct {p0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->configureAsChild(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    :goto_1
    if-nez v1, :cond_4

    .line 138
    sget-object p2, Landroid/content/pm/ApplicationInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/pm/ApplicationInfo;

    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 139
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    if-nez p2, :cond_3

    goto :goto_2

    :cond_3
    sget-object p2, Landroid/util/SizeF;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {p2, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object p2

    move-object v2, p2

    check-cast v2, Landroid/util/SizeF;

    :goto_2
    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIdealSize:Landroid/util/SizeF;

    .line 140
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLayoutId:I

    .line 141
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    .line 142
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    .line 143
    invoke-direct {p0, p1, p4}, Lcom/zte/toolsdk/widget/RemoteViews;->readActionsFromParcel(Landroid/os/Parcel;I)V

    goto :goto_4

    :cond_4
    const/4 p2, 0x2

    if-ne v1, p2, :cond_7

    .line 144
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    const/16 v1, 0x10

    if-gt p2, v1, :cond_6

    .line 145
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p2}, Ljava/util/ArrayList;-><init>(I)V

    :goto_3
    if-ge v0, p2, :cond_5

    .line 146
    new-instance v2, Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getHierarchyRootData()Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    move-result-object v3

    invoke-direct {v2, p1, v3, p3, p4}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Landroid/os/Parcel;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;Landroid/content/pm/ApplicationInfo;I)V

    .line 147
    iget-object p3, v2, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 148
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 149
    :cond_5
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->initializeSizedRemoteViews(Ljava/util/Iterator;)Ljava/util/Map;

    .line 150
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->findSmallestRemoteView()Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object p2

    .line 151
    iget-object p3, p2, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 152
    iget p3, p2, Lcom/zte/toolsdk/widget/RemoteViews;->mLayoutId:I

    iput p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLayoutId:I

    .line 153
    iget p3, p2, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    iput p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    .line 154
    iget p2, p2, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    goto :goto_4

    .line 155
    :cond_6
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Too many views in mapping from size to RemoteViews."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 156
    :cond_7
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getHierarchyRootData()Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    move-result-object v0

    invoke-direct {p2, p1, v0, p3, p4}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Landroid/os/Parcel;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;Landroid/content/pm/ApplicationInfo;I)V

    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 157
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getHierarchyRootData()Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    move-result-object p3

    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    iget-object v0, v0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    invoke-direct {p2, p1, p3, v0, p4}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Landroid/os/Parcel;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;Landroid/content/pm/ApplicationInfo;I)V

    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 158
    iget-object p3, p2, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    iput-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 159
    iget p3, p2, Lcom/zte/toolsdk/widget/RemoteViews;->mLayoutId:I

    iput p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLayoutId:I

    .line 160
    iget p3, p2, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    iput p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    .line 161
    iget p2, p2, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    .line 162
    :goto_4
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    .line 163
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide p2

    iput-wide p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mProviderInstanceId:J

    .line 164
    invoke-virtual {p1}, Landroid/os/Parcel;->readBoolean()Z

    move-result p1

    iput-boolean p1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mHasDrawInstructions:Z

    .line 165
    iget-boolean p1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    if-eqz p1, :cond_8

    .line 166
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->configureDescendantsAsChildren()V

    :cond_8
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;Landroid/content/pm/ApplicationInfo;ILcom/zte/toolsdk/widget/z;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Landroid/os/Parcel;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;Landroid/content/pm/ApplicationInfo;I)V

    return-void
.end method

.method public constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;)V
    .locals 4
    .annotation build Landroid/annotation/FlaggedApi;
        value = "android.appwidget.flags.draw_data_parcel"
    .end annotation

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 103
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    .line 104
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    invoke-direct {v1}, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;-><init>()V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 105
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    invoke-direct {v1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 106
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    invoke-direct {v1}, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;-><init>()V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    const/4 v1, 0x1

    .line 107
    iput-boolean v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    const/4 v2, 0x0

    .line 108
    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 109
    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 110
    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 111
    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIdealSize:Landroid/util/SizeF;

    .line 112
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    const/4 v0, -0x1

    .line 113
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    const-wide/16 v2, -0x1

    .line 114
    iput-wide v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mProviderInstanceId:J

    .line 115
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    iput-boolean v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mHasDrawInstructions:Z

    .line 117
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;

    invoke-direct {v0, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews$DrawInstructions;)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;)V
    .locals 4

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 75
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    .line 76
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    invoke-direct {v1}, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;-><init>()V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 77
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    invoke-direct {v1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 78
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    invoke-direct {v1}, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;-><init>()V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    const/4 v1, 0x1

    .line 79
    iput-boolean v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    const/4 v1, 0x0

    .line 80
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 81
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 82
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 83
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIdealSize:Landroid/util/SizeF;

    .line 84
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    const/4 v0, -0x1

    .line 85
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    const-wide/16 v2, -0x1

    .line 86
    iput-wide v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mProviderInstanceId:J

    .line 87
    invoke-direct {p0, p1, v1}, Lcom/zte/toolsdk/widget/RemoteViews;->initializeFrom(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews;)V

    return-void
.end method

.method public constructor <init>(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews;)V
    .locals 2

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 22
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    .line 23
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    invoke-direct {v1}, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;-><init>()V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 24
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    invoke-direct {v1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 25
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    invoke-direct {v1}, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;-><init>()V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    const/4 v1, 0x1

    .line 26
    iput-boolean v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    const/4 v1, 0x0

    .line 27
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 28
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 29
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 30
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIdealSize:Landroid/util/SizeF;

    .line 31
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    const/4 v0, -0x1

    .line 32
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    const-wide/16 v0, -0x1

    .line 33
    iput-wide v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mProviderInstanceId:J

    if-eqz p1, :cond_2

    if-eqz p2, :cond_2

    .line 34
    iget-object v0, p2, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {p1, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasSameAppInfo(Landroid/content/pm/ApplicationInfo;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 35
    iget-object v0, p2, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 36
    iget v0, p2, Lcom/zte/toolsdk/widget/RemoteViews;->mLayoutId:I

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLayoutId:I

    .line 37
    iget v0, p2, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    .line 38
    iget v0, p2, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    .line 39
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 40
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 41
    iget-object p2, p2, Lcom/zte/toolsdk/widget/RemoteViews;->mClassCookies:Ljava/util/Map;

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    iget-object p2, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mClassCookies:Ljava/util/Map;

    :goto_0
    iput-object p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mClassCookies:Ljava/util/Map;

    .line 42
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->configureDescendantsAsChildren()V

    return-void

    .line 43
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Both RemoteViews must share the same package and user"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 44
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Both RemoteViews must be non-null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .line 2
    invoke-static {}, Landroid/os/UserHandle;->myUserId()I

    move-result v0

    invoke-static {p1, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Landroid/content/pm/ApplicationInfo;I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 4
    iput p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Landroid/util/SizeF;",
            "Lcom/zte/toolsdk/widget/RemoteViews;",
            ">;)V"
        }
    .end annotation

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 46
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    .line 47
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    invoke-direct {v1}, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;-><init>()V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 48
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    invoke-direct {v1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 49
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    invoke-direct {v1}, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;-><init>()V

    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    const/4 v1, 0x1

    .line 50
    iput-boolean v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    const/4 v2, 0x0

    .line 51
    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 52
    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 53
    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 54
    iput-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIdealSize:Landroid/util/SizeF;

    .line 55
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    const/4 v0, -0x1

    .line 56
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    const-wide/16 v2, -0x1

    .line 57
    iput-wide v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mProviderInstanceId:J

    .line 58
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 59
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    const/16 v2, 0x10

    if-gt v0, v2, :cond_1

    .line 60
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    if-ne v0, v1, :cond_0

    .line 61
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 62
    invoke-direct {p0, p1, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->initializeFrom(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews;)V

    return-void

    .line 63
    :cond_0
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    move-result-object p1

    new-instance v0, Lcom/zte/toolsdk/widget/f;

    invoke-direct {v0}, Lcom/zte/toolsdk/widget/f;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object p1

    .line 64
    invoke-interface {p1}, Ljava/util/stream/Stream;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 65
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->initializeSizedRemoteViews(Ljava/util/Iterator;)Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mClassCookies:Ljava/util/Map;

    .line 66
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->findSmallestRemoteView()Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object p1

    .line 67
    iget-object v0, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 68
    iget v0, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mLayoutId:I

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLayoutId:I

    .line 69
    iget v0, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    .line 70
    iget p1, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    .line 71
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->configureDescendantsAsChildren()V

    return-void

    .line 72
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Too many RemoteViews in constructor"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 73
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "The set of RemoteViews cannot be empty"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static bridge synthetic A(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->finalizeViewRecycling(Landroid/view/ViewGroup;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic B(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getHierarchyRootData()Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic C(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Context;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/util/SizeF;Landroid/view/View;)Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/zte/toolsdk/widget/RemoteViews;->getInternalAsyncApplyTask(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/util/SizeF;Landroid/view/View;)Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic D(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Context;)Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->getRemoteViewsToApply(Landroid/content/Context;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic E(Lcom/zte/toolsdk/widget/RemoteViews;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasDrawInstructions()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic F(Lcom/zte/toolsdk/widget/RemoteViews;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasLandscapeAndPortraitLayouts()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic G(Lcom/zte/toolsdk/widget/RemoteViews;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasMultipleLayouts()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic H(Lcom/zte/toolsdk/widget/RemoteViews;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasSizedRemoteViews()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic I(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/view/ViewGroup;ILcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/zte/toolsdk/widget/RemoteViews;->inflateView(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/view/ViewGroup;ILcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic J(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Context;Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/zte/toolsdk/widget/RemoteViews;->reapplyNestedViews(Landroid/content/Context;Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic K(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;ILandroid/util/SparseArray;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->writeToParcel(Landroid/os/Parcel;ILandroid/util/SparseArray;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic L()Lcom/zte/toolsdk/widget/RemoteViews$Action;
    .locals 1

    .line 1
    sget-object v0, Lcom/zte/toolsdk/widget/RemoteViews;->ACTION_NOOP:Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic M()Landroid/os/Parcel$ReadWriteHelper;
    .locals 1

    .line 1
    sget-object v0, Lcom/zte/toolsdk/widget/RemoteViews;->ALTERNATIVE_DEFAULT:Landroid/os/Parcel$ReadWriteHelper;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic N()Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;
    .locals 1

    .line 1
    sget-object v0, Lcom/zte/toolsdk/widget/RemoteViews;->DEFAULT_INTERACTION_HANDLER:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic O(Landroid/view/View;Ljava/lang/String;Ljava/lang/Class;Z)Ljava/lang/reflect/Method;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->getMethod(Landroid/view/View;Ljava/lang/String;Ljava/lang/Class;Z)Ljava/lang/reflect/Method;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic P(Landroid/view/ViewGroup;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getNextRecyclableChild(Landroid/view/ViewGroup;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic Q(Landroid/content/pm/ApplicationInfo;)Landroid/util/Pair;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getPackageUserKey(Landroid/content/pm/ApplicationInfo;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic R(I)Ljava/lang/Class;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getParameterType(I)Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic S(Landroid/view/View;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getStableId(Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic T(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasStableId(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic U(Landroid/view/ViewGroup;II)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setNextRecyclableChild(Landroid/view/ViewGroup;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic V(Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->setStableId(Landroid/view/View;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic W(Landroid/graphics/drawable/Icon;Ljava/util/function/Consumer;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->visitIconUri(Landroid/graphics/drawable/Icon;Ljava/util/function/Consumer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Landroid/view/View;Landroid/app/PendingIntent;Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)Z
    .locals 0

    .line 1
    invoke-virtual {p2, p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->getLaunchOptions(Landroid/view/View;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->startPendingIntent(Landroid/view/View;Landroid/app/PendingIntent;Landroid/util/Pair;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasMultipleLayouts()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x0

    .line 25
    :goto_0
    if-ge v1, v0, :cond_2

    .line 26
    .line 27
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mergeBehavior()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    invoke-virtual {v2}, Lcom/zte/toolsdk/widget/RemoteViews$Action;->getUniqueKey()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;->getUniqueKey()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    if-eqz v4, :cond_1

    .line 52
    .line 53
    if-nez v3, :cond_1

    .line 54
    .line 55
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    :goto_1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    new-instance p0, Ljava/lang/RuntimeException;

    .line 71
    .line 72
    const-string p1, "RemoteViews specifying separate layouts for orientation or size cannot be modified. Instead, fully configure each layouts individually before constructing the combined layout."

    .line 73
    .line 74
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    throw p0
.end method

.method private apply(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Landroid/view/View;
    .locals 6

    .line 8
    invoke-virtual {p0, p1, p4}, Lcom/zte/toolsdk/widget/RemoteViews;->getRemoteViewsToApply(Landroid/content/Context;Landroid/util/SizeF;)Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object v2

    .line 9
    iget v4, p5, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->applyThemeResId:I

    iget-object v5, p5, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->colorResources:Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews;->inflateView(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/view/ViewGroup;ILcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Landroid/view/View;

    move-result-object p0

    .line 10
    invoke-direct {v2, p0, p3, p5}, Lcom/zte/toolsdk/widget/RemoteViews;->performApply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V

    return-object p0
.end method

.method public static synthetic b(Ljava/util/Map$Entry;)Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 2

    .line 1
    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Landroid/util/SizeF;

    .line 12
    .line 13
    invoke-direct {v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews;->setIdealSize(Landroid/util/SizeF;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 21
    .line 22
    return-object p0
.end method

.method private configureAsChild(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    .line 3
    .line 4
    iget-object v0, p1, Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 7
    .line 8
    iget-object v0, p1, Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;->mRemoteCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;->mClassCookies:Ljava/util/Map;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mClassCookies:Ljava/util/Map;

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->configureDescendantsAsChildren()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private configureDescendantsAsChildren()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;->getOrPut(Landroid/content/pm/ApplicationInfo;)Landroid/content/pm/ApplicationInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getHierarchyRootData()Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasSizedRemoteViews()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 38
    .line 39
    invoke-direct {v1, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->configureAsChild(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasLandscapeAndPortraitLayouts()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 50
    .line 51
    invoke-direct {v1, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->configureAsChild(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 55
    .line 56
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->configureAsChild(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 61
    .line 62
    if-eqz p0, :cond_2

    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-eqz v1, :cond_2

    .line 73
    .line 74
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 79
    .line 80
    invoke-virtual {v1, v0}, Lcom/zte/toolsdk/widget/RemoteViews$Action;->setHierarchyRootData(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    return-void
.end method

.method private static createInitializedFrom(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->initializeFrom(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic e(Ljava/lang/Class;)Z
    .locals 1

    .line 1
    const-class v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteView;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private finalizeViewRecycling(Landroid/view/ViewGroup;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->getNextRecyclableChild(Landroid/view/ViewGroup;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    sub-int/2addr v1, v0

    .line 18
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->removeViews(II)V

    .line 19
    .line 20
    .line 21
    :cond_0
    const/4 v0, -0x1

    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-static {p1, v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews;->setNextRecyclableChild(Landroid/view/ViewGroup;II)V

    .line 24
    .line 25
    .line 26
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-ge v1, v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    instance-of v2, v0, Landroid/view/ViewGroup;

    .line 37
    .line 38
    if-eqz v2, :cond_1

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/view/View;->isRootNamespace()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-nez v2, :cond_1

    .line 45
    .line 46
    check-cast v0, Landroid/view/ViewGroup;

    .line 47
    .line 48
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->finalizeViewRecycling(Landroid/view/ViewGroup;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    return-void
.end method

.method private findBestFitLayout(Landroid/util/SizeF;)Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const v2, 0x7f7fffff    # Float.MAX_VALUE

    .line 9
    .line 10
    .line 11
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_3

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    check-cast v3, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 22
    .line 23
    invoke-direct {v3}, Lcom/zte/toolsdk/widget/RemoteViews;->getIdealSize()Landroid/util/SizeF;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    if-eqz v4, :cond_2

    .line 28
    .line 29
    invoke-static {v4, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->fitsIn(Landroid/util/SizeF;Landroid/util/SizeF;)Z

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    if-eqz v5, :cond_0

    .line 34
    .line 35
    if-nez v1, :cond_1

    .line 36
    .line 37
    invoke-static {v4, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->squareDistance(Landroid/util/SizeF;Landroid/util/SizeF;)F

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    move v2, v1

    .line 42
    move-object v1, v3

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-static {v4, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->squareDistance(Landroid/util/SizeF;Landroid/util/SizeF;)F

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    cmpg-float v5, v4, v2

    .line 49
    .line 50
    if-gez v5, :cond_0

    .line 51
    .line 52
    move-object v1, v3

    .line 53
    move v2, v4

    .line 54
    goto :goto_0

    .line 55
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 56
    .line 57
    const-string p1, "Expected RemoteViews to have ideal size"

    .line 58
    .line 59
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    throw p0

    .line 63
    :cond_3
    if-nez v1, :cond_4

    .line 64
    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    const-string v1, "Could not find a RemoteViews fitting the current size: "

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    const-string v0, "RemoteViews"

    .line 83
    .line 84
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->findSmallestRemoteView()Lcom/zte/toolsdk/widget/RemoteViews;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0

    .line 92
    :cond_4
    return-object v1
.end method

.method private findSmallestRemoteView()Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 14
    .line 15
    return-object p0
.end method

.method private static fitsIn(Landroid/util/SizeF;Landroid/util/SizeF;)Z
    .locals 6

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/util/SizeF;->getWidth()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    float-to-double v0, v0

    .line 8
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 13
    .line 14
    add-double/2addr v0, v2

    .line 15
    invoke-virtual {p0}, Landroid/util/SizeF;->getWidth()F

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    float-to-double v4, v4

    .line 20
    cmpl-double v0, v0, v4

    .line 21
    .line 22
    if-lez v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/util/SizeF;->getHeight()F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    float-to-double v0, p1

    .line 29
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    add-double/2addr v0, v2

    .line 34
    invoke-virtual {p0}, Landroid/util/SizeF;->getHeight()F

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    float-to-double p0, p0

    .line 39
    cmpl-double p0, v0, p0

    .line 40
    .line 41
    if-lez p0, :cond_0

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_0
    const/4 p0, 0x0

    .line 46
    return p0
.end method

.method static bridge synthetic g(Lcom/zte/toolsdk/widget/RemoteViews;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method private getActionFromParcel(Landroid/os/Parcel;I)Lcom/zte/toolsdk/widget/RemoteViews$Action;
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    :pswitch_0
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 9
    .line 10
    new-instance p1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string p2, "Tag "

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p2, " not found"

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    throw p0

    .line 36
    :pswitch_1
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;

    .line 37
    .line 38
    invoke-direct {p2, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V

    .line 39
    .line 40
    .line 41
    return-object p2

    .line 42
    :pswitch_2
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews$SetOnGroupCollapseResponse;

    .line 43
    .line 44
    invoke-direct {p2, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnGroupCollapseResponse;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V

    .line 45
    .line 46
    .line 47
    return-object p2

    .line 48
    :pswitch_3
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews$SetOnGroupExpandResponse;

    .line 49
    .line 50
    invoke-direct {p2, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnGroupExpandResponse;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V

    .line 51
    .line 52
    .line 53
    return-object p2

    .line 54
    :pswitch_4
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;

    .line 55
    .line 56
    invoke-direct {p2, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V

    .line 57
    .line 58
    .line 59
    return-object p2

    .line 60
    :pswitch_5
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews$SetOnSeekBarChangeResponse;

    .line 61
    .line 62
    invoke-direct {p2, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnSeekBarChangeResponse;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V

    .line 63
    .line 64
    .line 65
    return-object p2

    .line 66
    :pswitch_6
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;

    .line 67
    .line 68
    invoke-direct {p2, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawInstructionAction;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V

    .line 69
    .line 70
    .line 71
    return-object p2

    .line 72
    :pswitch_7
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews$SetOnStylusHandwritingResponse;

    .line 73
    .line 74
    invoke-direct {p2, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnStylusHandwritingResponse;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V

    .line 75
    .line 76
    .line 77
    return-object p2

    .line 78
    :pswitch_8
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;

    .line 79
    .line 80
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;-><init>(Landroid/os/Parcel;)V

    .line 81
    .line 82
    .line 83
    return-object p0

    .line 84
    :pswitch_9
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;

    .line 85
    .line 86
    invoke-direct {p2, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V

    .line 87
    .line 88
    .line 89
    return-object p2

    .line 90
    :pswitch_a
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;

    .line 91
    .line 92
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;-><init>(Landroid/os/Parcel;)V

    .line 93
    .line 94
    .line 95
    return-object p0

    .line 96
    :pswitch_b
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;

    .line 97
    .line 98
    invoke-direct {p2, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V

    .line 99
    .line 100
    .line 101
    return-object p2

    .line 102
    :pswitch_c
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$SetViewOutlinePreferredRadiusAction;

    .line 103
    .line 104
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetViewOutlinePreferredRadiusAction;-><init>(Landroid/os/Parcel;)V

    .line 105
    .line 106
    .line 107
    return-object p0

    .line 108
    :pswitch_d
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRadioGroupCheckedAction;

    .line 109
    .line 110
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetRadioGroupCheckedAction;-><init>(Landroid/os/Parcel;)V

    .line 111
    .line 112
    .line 113
    return-object p0

    .line 114
    :pswitch_e
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$SetCompoundButtonCheckedAction;

    .line 115
    .line 116
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetCompoundButtonCheckedAction;-><init>(Landroid/os/Parcel;)V

    .line 117
    .line 118
    .line 119
    return-object p0

    .line 120
    :pswitch_f
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$ComplexUnitDimensionReflectionAction;

    .line 121
    .line 122
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ComplexUnitDimensionReflectionAction;-><init>(Landroid/os/Parcel;)V

    .line 123
    .line 124
    .line 125
    return-object p0

    .line 126
    :pswitch_10
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;

    .line 127
    .line 128
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;-><init>(Landroid/os/Parcel;)V

    .line 129
    .line 130
    .line 131
    return-object p0

    .line 132
    :pswitch_11
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoveFromParentAction;

    .line 133
    .line 134
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoveFromParentAction;-><init>(Landroid/os/Parcel;)V

    .line 135
    .line 136
    .line 137
    return-object p0

    .line 138
    :pswitch_12
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$SetIntTagAction;

    .line 139
    .line 140
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetIntTagAction;-><init>(Landroid/os/Parcel;)V

    .line 141
    .line 142
    .line 143
    return-object p0

    .line 144
    :pswitch_13
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews$SetRippleDrawableColor;

    .line 145
    .line 146
    invoke-direct {p2, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetRippleDrawableColor;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V

    .line 147
    .line 148
    .line 149
    return-object p2

    .line 150
    :pswitch_14
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;

    .line 151
    .line 152
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;-><init>(Landroid/os/Parcel;)V

    .line 153
    .line 154
    .line 155
    return-object p0

    .line 156
    :pswitch_15
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteInputsAction;

    .line 157
    .line 158
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteInputsAction;-><init>(Landroid/os/Parcel;)V

    .line 159
    .line 160
    .line 161
    return-object p0

    .line 162
    :pswitch_16
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewPaddingAction;

    .line 163
    .line 164
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewPaddingAction;-><init>(Landroid/os/Parcel;)V

    .line 165
    .line 166
    .line 167
    return-object p0

    .line 168
    :pswitch_17
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewSizeAction;

    .line 169
    .line 170
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$TextViewSizeAction;-><init>(Landroid/os/Parcel;)V

    .line 171
    .line 172
    .line 173
    return-object p0

    .line 174
    :pswitch_18
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews$BitmapReflectionAction;

    .line 175
    .line 176
    invoke-direct {p2, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$BitmapReflectionAction;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V

    .line 177
    .line 178
    .line 179
    return-object p2

    .line 180
    :pswitch_19
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;

    .line 181
    .line 182
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;-><init>(Landroid/os/Parcel;)V

    .line 183
    .line 184
    .line 185
    return-object p0

    .line 186
    :pswitch_1a
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteViewsAdapterIntent;

    .line 187
    .line 188
    invoke-direct {p2, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteViewsAdapterIntent;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V

    .line 189
    .line 190
    .line 191
    return-object p2

    .line 192
    :pswitch_1b
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$SetPendingIntentTemplate;

    .line 193
    .line 194
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetPendingIntentTemplate;-><init>(Landroid/os/Parcel;)V

    .line 195
    .line 196
    .line 197
    return-object p0

    .line 198
    :pswitch_1c
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;

    .line 199
    .line 200
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;-><init>(Landroid/os/Parcel;)V

    .line 201
    .line 202
    .line 203
    return-object p0

    .line 204
    :pswitch_1d
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$SetEmptyView;

    .line 205
    .line 206
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetEmptyView;-><init>(Landroid/os/Parcel;)V

    .line 207
    .line 208
    .line 209
    return-object p0

    .line 210
    :pswitch_1e
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews$ViewContentNavigation;

    .line 211
    .line 212
    invoke-direct {p2, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewContentNavigation;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V

    .line 213
    .line 214
    .line 215
    return-object p2

    .line 216
    :pswitch_1f
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;

    .line 217
    .line 218
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 219
    .line 220
    invoke-direct {v0, p0, p1, v1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;Landroid/content/pm/ApplicationInfo;I)V

    .line 221
    .line 222
    .line 223
    return-object v0

    .line 224
    :pswitch_20
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawableTint;

    .line 225
    .line 226
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawableTint;-><init>(Landroid/os/Parcel;)V

    .line 227
    .line 228
    .line 229
    return-object p0

    .line 230
    :pswitch_21
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 231
    .line 232
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(Landroid/os/Parcel;)V

    .line 233
    .line 234
    .line 235
    return-object p0

    .line 236
    :pswitch_22
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;

    .line 237
    .line 238
    invoke-direct {p2, p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/os/Parcel;)V

    .line 239
    .line 240
    .line 241
    return-object p2

    .line 242
    nop

    .line 243
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_0
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_15
        :pswitch_14
        :pswitch_0
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private static getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;
    .locals 3

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/app/Application;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget v2, v1, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 16
    .line 17
    invoke-static {v2}, Landroid/os/UserHandle;->getUserId(I)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-ne v2, p1, :cond_2

    .line 22
    .line 23
    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return-object v1

    .line 33
    :cond_2
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Landroid/app/Application;->getBaseContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Landroid/os/UserHandle;

    .line 38
    .line 39
    invoke-direct {v1, p1}, Landroid/os/UserHandle;-><init>(I)V

    .line 40
    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    invoke-virtual {v0, p0, p1, v1}, Landroid/content/Context;->createPackageContextAsUser(Ljava/lang/String;ILandroid/os/UserHandle;)Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 48
    .line 49
    .line 50
    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    return-object p0

    .line 52
    :catch_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 53
    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    const-string v1, "No such package "

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    throw p1

    .line 75
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 76
    .line 77
    const-string p1, "Cannot create remote views out of an aplication."

    .line 78
    .line 79
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    throw p0
.end method

.method private getChildId(Lcom/zte/toolsdk/widget/RemoteViews;)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasSizedRemoteViews()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    if-eqz v1, :cond_2

    .line 11
    .line 12
    move v1, v0

    .line 13
    :goto_0
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-ge v1, v3, :cond_2

    .line 20
    .line 21
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    if-ne v3, p1, :cond_1

    .line 28
    .line 29
    add-int/2addr v1, v2

    .line 30
    return v1

    .line 31
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasLandscapeAndPortraitLayouts()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_4

    .line 39
    .line 40
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 41
    .line 42
    if-ne v1, p1, :cond_3

    .line 43
    .line 44
    return v2

    .line 45
    :cond_3
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 46
    .line 47
    if-ne p0, p1, :cond_4

    .line 48
    .line 49
    const/4 p0, 0x2

    .line 50
    return p0

    .line 51
    :cond_4
    return v0
.end method

.method private getContextForResourcesEnsuringCorrectCachedApkPaths(Landroid/content/Context;)Landroid/content/Context;
    .locals 4

    .line 1
    const-string v0, "RemoteViews"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/content/Context;->getUserId()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 12
    .line 13
    iget v2, v2, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 14
    .line 15
    invoke-static {v2}, Landroid/os/UserHandle;->getUserId(I)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-ne v1, v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 26
    .line 27
    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    return-object p1

    .line 36
    :cond_0
    :try_start_0
    const-string v1, "android.app.LoadedApk"

    .line 37
    .line 38
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "checkAndUpdateApkPaths"

    .line 43
    .line 44
    const-class v3, Landroid/content/pm/ApplicationInfo;

    .line 45
    .line 46
    filled-new-array {v3}, [Ljava/lang/Class;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 55
    .line 56
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    const/4 v3, 0x0

    .line 61
    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 65
    .line 66
    const/4 v2, 0x4

    .line 67
    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->createApplicationContext(Landroid/content/pm/ApplicationInfo;I)Landroid/content/Context;

    .line 68
    .line 69
    .line 70
    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    return-object p0

    .line 72
    :catch_0
    move-exception p0

    .line 73
    new-instance v1, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string v2, "checkAndUpdateApkPaths error: "

    .line 79
    .line 80
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :catch_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .line 102
    .line 103
    const-string v2, "Package name "

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 109
    .line 110
    iget-object p0, p0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string p0, " not found"

    .line 116
    .line 117
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    :cond_1
    :goto_0
    return-object p1
.end method

.method private getFillInIntent()Landroid/util/SparseArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mFillInIntent:Landroid/util/SparseArray;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/util/SparseArray;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mFillInIntent:Landroid/util/SparseArray;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mFillInIntent:Landroid/util/SparseArray;

    .line 13
    .line 14
    return-object p0
.end method

.method private getHierarchyRootData()Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;
    .locals 4

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mClassCookies:Ljava/util/Map;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, v3, p0}, Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;-><init>(Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;Ljava/util/Map;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method private getIdealSize()Landroid/util/SizeF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIdealSize:Landroid/util/SizeF;

    .line 2
    .line 3
    return-object p0
.end method

.method private getInternalAsyncApplyTask(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/util/SizeF;Landroid/view/View;)Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;
    .locals 10

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p5}, Lcom/zte/toolsdk/widget/RemoteViews;->getRemoteViewsToApply(Landroid/content/Context;Landroid/util/SizeF;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    const/4 v8, 0x0

    .line 8
    const/4 v9, 0x0

    .line 9
    move-object v1, p0

    .line 10
    move-object v4, p1

    .line 11
    move-object v3, p2

    .line 12
    move-object v5, p3

    .line 13
    move-object v6, p4

    .line 14
    move-object/from16 v7, p6

    .line 15
    .line 16
    invoke-direct/range {v0 .. v9}, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/view/ViewGroup;Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/view/View;ZLcom/zte/toolsdk/widget/z;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method private static getMethod(Landroid/view/View;Ljava/lang/String;Ljava/lang/Class;Z)Ljava/lang/reflect/Method;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;Z)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/zte/toolsdk/widget/RemoteViews;->sMethods:Landroid/util/ArrayMap;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/zte/toolsdk/widget/RemoteViews;->sLookupKey:Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;

    .line 9
    .line 10
    invoke-virtual {v1, p0, p2, p1}, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;->set(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/zte/toolsdk/widget/RemoteViews$MethodArgs;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-nez v1, :cond_2

    .line 21
    .line 22
    if-nez p2, :cond_0

    .line 23
    .line 24
    :try_start_1
    new-array v1, v2, [Ljava/lang/Class;

    .line 25
    .line 26
    invoke-virtual {p0, p1, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto/16 :goto_5

    .line 33
    .line 34
    :cond_0
    filled-new-array {p2}, [Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {p0, p1, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    :goto_0
    new-instance v3, Lcom/zte/toolsdk/widget/RemoteViews$MethodArgs;

    .line 43
    .line 44
    invoke-direct {v3}, Lcom/zte/toolsdk/widget/RemoteViews$MethodArgs;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v1, v3, Lcom/zte/toolsdk/widget/RemoteViews$MethodArgs;->syncMethod:Ljava/lang/reflect/Method;

    .line 48
    .line 49
    const-class v4, Landroid/view/RemotableViewMethod;

    .line 50
    .line 51
    invoke-virtual {v1, v4}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Landroid/view/RemotableViewMethod;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    .line 57
    if-eqz v1, :cond_1

    .line 58
    .line 59
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    const-string v5, "asyncImpl"

    .line 64
    .line 65
    new-array v6, v2, [Ljava/lang/Class;

    .line 66
    .line 67
    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    new-array v5, v2, [Ljava/lang/Object;

    .line 72
    .line 73
    invoke-virtual {v4, v1, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    check-cast v1, Ljava/lang/String;

    .line 78
    .line 79
    iput-object v1, v3, Lcom/zte/toolsdk/widget/RemoteViews$MethodArgs;->asyncMethodName:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :catch_0
    move-exception v1

    .line 83
    :try_start_3
    const-string v4, "RemoteViews"

    .line 84
    .line 85
    new-instance v5, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 88
    .line 89
    .line 90
    const-string v6, "RemotableViewMethod asyncImpl error: "

    .line 91
    .line 92
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-static {v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 107
    .line 108
    .line 109
    :cond_1
    :goto_1
    :try_start_4
    new-instance v1, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;

    .line 110
    .line 111
    invoke-direct {v1}, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1, p0, p2, p1}, Lcom/zte/toolsdk/widget/RemoteViews$MethodKey;->set(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    sget-object p2, Lcom/zte/toolsdk/widget/RemoteViews;->sMethods:Landroid/util/ArrayMap;

    .line 118
    .line 119
    invoke-virtual {p2, v1, v3}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-object v1, v3

    .line 123
    goto :goto_2

    .line 124
    :catch_1
    new-instance p3, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 125
    .line 126
    new-instance v1, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    const-string v2, "view: "

    .line 132
    .line 133
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string p0, " doesn\'t have method: "

    .line 144
    .line 145
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews;->getParameters(Ljava/lang/Class;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-direct {p3, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    throw p3

    .line 166
    :cond_2
    :goto_2
    if-nez p3, :cond_3

    .line 167
    .line 168
    iget-object p0, v1, Lcom/zte/toolsdk/widget/RemoteViews$MethodArgs;->syncMethod:Ljava/lang/reflect/Method;

    .line 169
    .line 170
    monitor-exit v0

    .line 171
    return-object p0

    .line 172
    :cond_3
    iget-object p2, v1, Lcom/zte/toolsdk/widget/RemoteViews$MethodArgs;->asyncMethodName:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 175
    .line 176
    .line 177
    move-result p2

    .line 178
    if-eqz p2, :cond_4

    .line 179
    .line 180
    monitor-exit v0

    .line 181
    const/4 p0, 0x0

    .line 182
    return-object p0

    .line 183
    :cond_4
    iget-object p2, v1, Lcom/zte/toolsdk/widget/RemoteViews$MethodArgs;->asyncMethod:Ljava/lang/reflect/Method;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 184
    .line 185
    if-nez p2, :cond_6

    .line 186
    .line 187
    :try_start_5
    iget-object p2, v1, Lcom/zte/toolsdk/widget/RemoteViews$MethodArgs;->syncMethod:Ljava/lang/reflect/Method;

    .line 188
    .line 189
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    .line 190
    .line 191
    .line 192
    move-result-object p2

    .line 193
    array-length p3, p2

    .line 194
    if-lez p3, :cond_5

    .line 195
    .line 196
    array-length p3, p2

    .line 197
    const/4 v3, 0x1

    .line 198
    sub-int/2addr p3, v3

    .line 199
    new-array v4, p3, [Ljava/lang/Class;

    .line 200
    .line 201
    invoke-static {p2, v3, v4, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 202
    .line 203
    .line 204
    goto :goto_3

    .line 205
    :cond_5
    new-array v4, v2, [Ljava/lang/Class;

    .line 206
    .line 207
    :goto_3
    iget-object p2, v1, Lcom/zte/toolsdk/widget/RemoteViews$MethodArgs;->asyncMethodName:Ljava/lang/String;

    .line 208
    .line 209
    invoke-virtual {p0, p2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    iput-object p0, v1, Lcom/zte/toolsdk/widget/RemoteViews$MethodArgs;->asyncMethod:Ljava/lang/reflect/Method;
    :try_end_5
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 214
    .line 215
    goto :goto_4

    .line 216
    :catch_2
    :try_start_6
    new-instance p0, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 217
    .line 218
    new-instance p2, Ljava/lang/StringBuilder;

    .line 219
    .line 220
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 221
    .line 222
    .line 223
    const-string p3, "Async implementation declared as "

    .line 224
    .line 225
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    iget-object p3, v1, Lcom/zte/toolsdk/widget/RemoteViews$MethodArgs;->asyncMethodName:Ljava/lang/String;

    .line 229
    .line 230
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    const-string p3, " but not defined for "

    .line 234
    .line 235
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    throw p0

    .line 249
    :cond_6
    :goto_4
    iget-object p0, v1, Lcom/zte/toolsdk/widget/RemoteViews$MethodArgs;->asyncMethod:Ljava/lang/reflect/Method;

    .line 250
    .line 251
    monitor-exit v0

    .line 252
    return-object p0

    .line 253
    :goto_5
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 254
    throw p0
.end method

.method private static getNextRecyclableChild(Landroid/view/ViewGroup;)I
    .locals 1

    .line 1
    const v0, 0x10204c0

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Ljava/lang/Integer;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    const/4 p0, -0x1

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private static getPackageUserKey(Landroid/content/pm/ApplicationInfo;)Landroid/util/Pair;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/pm/ApplicationInfo;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget p0, p0, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 9
    .line 10
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {v0, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method private static getParameterType(I)Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0

    .line 6
    :pswitch_0
    const-class p0, Landroid/graphics/BlendMode;

    .line 7
    .line 8
    return-object p0

    .line 9
    :pswitch_1
    const-class p0, Landroid/graphics/drawable/Icon;

    .line 10
    .line 11
    return-object p0

    .line 12
    :pswitch_2
    const-class p0, Landroid/content/res/ColorStateList;

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_3
    const-class p0, Landroid/content/Intent;

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_4
    const-class p0, Landroid/os/Bundle;

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_5
    const-class p0, Landroid/graphics/Bitmap;

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_6
    const-class p0, Landroid/net/Uri;

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_7
    const-class p0, Ljava/lang/CharSequence;

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_8
    const-class p0, Ljava/lang/String;

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_9
    sget-object p0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_a
    sget-object p0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_b
    sget-object p0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_c
    sget-object p0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 43
    .line 44
    return-object p0

    .line 45
    :pswitch_d
    sget-object p0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_e
    sget-object p0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_f
    sget-object p0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    .line 52
    .line 53
    return-object p0

    .line 54
    :pswitch_10
    sget-object p0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 55
    .line 56
    return-object p0

    .line 57
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getParameters(Ljava/lang/Class;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, "()"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "("

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p0, ")"

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method private getPendingIntentTemplate()Landroid/util/SparseArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Landroid/app/PendingIntent;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPendingIntentTemplate:Landroid/util/SparseArray;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/util/SparseArray;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPendingIntentTemplate:Landroid/util/SparseArray;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPendingIntentTemplate:Landroid/util/SparseArray;

    .line 13
    .line 14
    return-object p0
.end method

.method private getRemoteViewsToApply(Landroid/content/Context;)Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasLandscapeAndPortraitLayouts()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 3
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    return-object p0

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    return-object p0

    .line 5
    :cond_1
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasSizedRemoteViews()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 6
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->findSmallestRemoteView()Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object p0

    :cond_2
    return-object p0
.end method

.method private getRemoteViewsToReapply(Landroid/content/Context;Landroid/view/View;Landroid/util/SizeF;)Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->getRemoteViewsToApply(Landroid/content/Context;Landroid/util/SizeF;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasMultipleLayouts()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    iget p0, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    .line 12
    .line 13
    const/4 p3, -0x1

    .line 14
    if-ne p0, p3, :cond_0

    .line 15
    .line 16
    const p0, 0x10204c1

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2, p0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    :cond_0
    invoke-virtual {p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->canRecycleView(Landroid/view/View;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    :cond_1
    return-object p1

    .line 32
    :cond_2
    new-instance p0, Ljava/lang/RuntimeException;

    .line 33
    .line 34
    const-string p1, "Attempting to re-apply RemoteViews to a view that that does not share the same root layout id."

    .line 35
    .line 36
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    throw p0
.end method

.method public static getSourceBounds(Landroid/view/View;)Landroid/graphics/Rect;
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/content/res/Resources;->getCompatibilityInfo()Landroid/content/res/CompatibilityInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v0, v0, Landroid/content/res/CompatibilityInfo;->applicationScale:F

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    new-array v1, v1, [I

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 19
    .line 20
    .line 21
    new-instance v2, Landroid/graphics/Rect;

    .line 22
    .line 23
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 24
    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    aget v3, v1, v3

    .line 28
    .line 29
    int-to-float v4, v3

    .line 30
    mul-float/2addr v4, v0

    .line 31
    const/high16 v5, 0x3f000000    # 0.5f

    .line 32
    .line 33
    add-float/2addr v4, v5

    .line 34
    float-to-int v4, v4

    .line 35
    iput v4, v2, Landroid/graphics/Rect;->left:I

    .line 36
    .line 37
    const/4 v4, 0x1

    .line 38
    aget v6, v1, v4

    .line 39
    .line 40
    int-to-float v6, v6

    .line 41
    mul-float/2addr v6, v0

    .line 42
    add-float/2addr v6, v5

    .line 43
    float-to-int v6, v6

    .line 44
    iput v6, v2, Landroid/graphics/Rect;->top:I

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    add-int/2addr v3, v6

    .line 51
    int-to-float v3, v3

    .line 52
    mul-float/2addr v3, v0

    .line 53
    add-float/2addr v3, v5

    .line 54
    float-to-int v3, v3

    .line 55
    iput v3, v2, Landroid/graphics/Rect;->right:I

    .line 56
    .line 57
    aget v1, v1, v4

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    add-int/2addr v1, p0

    .line 64
    int-to-float p0, v1

    .line 65
    mul-float/2addr p0, v0

    .line 66
    add-float/2addr p0, v5

    .line 67
    float-to-int p0, p0

    .line 68
    iput p0, v2, Landroid/graphics/Rect;->bottom:I

    .line 69
    .line 70
    return-object v2
.end method

.method private static getStableId(Landroid/view/View;)I
    .locals 1

    .line 1
    const v0, 0x10204c2

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Ljava/lang/Integer;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    const/4 p0, -0x1

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private static getViewLayoutId(Landroid/view/View;)I
    .locals 1

    .line 1
    const v0, 0x1020018

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Ljava/lang/Integer;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method static bridge synthetic h(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    .line 2
    .line 3
    return-object p0
.end method

.method private hasDrawInstructions()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mHasDrawInstructions:Z

    .line 2
    .line 3
    return p0
.end method

.method private hasLandscapeAndPortraitLayouts()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private hasMultipleLayouts()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasLandscapeAndPortraitLayouts()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasSizedRemoteViews()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method private hasSizedRemoteViews()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method private static hasStableId(Landroid/view/View;)Z
    .locals 1

    .line 1
    const v0, 0x10204c2

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method private inflateView(Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/view/ViewGroup;ILcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->getContextForResourcesEnsuringCorrectCachedApkPaths(Landroid/content/Context;)Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    invoke-virtual {p5, v0}, Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;->apply(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    new-instance p5, Lcom/zte/toolsdk/widget/RemoteViews$RemoteViewsContextWrapper;

    .line 11
    .line 12
    invoke-direct {p5, p1, v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteViewsContextWrapper;-><init>(Landroid/content/Context;Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    if-eqz p4, :cond_1

    .line 16
    .line 17
    new-instance v0, Landroid/view/ContextThemeWrapper;

    .line 18
    .line 19
    invoke-direct {v0, p5, p4}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 20
    .line 21
    .line 22
    move-object p5, v0

    .line 23
    :cond_1
    invoke-direct {p2}, Lcom/zte/toolsdk/widget/RemoteViews;->hasDrawInstructions()Z

    .line 24
    .line 25
    .line 26
    move-result p4

    .line 27
    const/4 v0, 0x0

    .line 28
    if-eqz p4, :cond_4

    .line 29
    .line 30
    :try_start_0
    const-string p1, "com.android.internal.widget.remotecompose.player.RemoteComposePlayer"

    .line 31
    .line 32
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-class p3, Landroid/content/Context;

    .line 37
    .line 38
    filled-new-array {p3}, [Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    invoke-virtual {p1, p3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    filled-new-array {p5}, [Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p4

    .line 50
    invoke-virtual {p3, p4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    const-string p4, "setDebug"

    .line 55
    .line 56
    sget-object p5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 57
    .line 58
    filled-new-array {p5}, [Ljava/lang/Class;

    .line 59
    .line 60
    .line 61
    move-result-object p5

    .line 62
    invoke-virtual {p1, p4, p5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    sget-boolean p4, Landroid/os/Build;->IS_USERDEBUG:Z

    .line 67
    .line 68
    if-nez p4, :cond_2

    .line 69
    .line 70
    sget-boolean p4, Landroid/os/Build;->IS_ENG:Z

    .line 71
    .line 72
    if-eqz p4, :cond_3

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :catch_0
    move-exception p1

    .line 76
    goto :goto_1

    .line 77
    :cond_2
    :goto_0
    const/4 v0, 0x1

    .line 78
    :cond_3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object p4

    .line 82
    filled-new-array {p4}, [Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p4

    .line 86
    invoke-virtual {p1, p3, p4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    check-cast p3, Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :goto_1
    new-instance p3, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string p4, "inflateView error:"

    .line 98
    .line 99
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    const-string p3, "RemoteViews"

    .line 114
    .line 115
    invoke-static {p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    const/4 p3, 0x0

    .line 119
    goto :goto_2

    .line 120
    :cond_4
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1, p5}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    iget-object p4, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLayoutInflaterFactory2:Landroid/view/LayoutInflater$Factory2;

    .line 129
    .line 130
    if-eqz p4, :cond_5

    .line 131
    .line 132
    invoke-virtual {p1, p4}, Landroid/view/LayoutInflater;->setFactory2(Landroid/view/LayoutInflater$Factory2;)V

    .line 133
    .line 134
    .line 135
    :cond_5
    invoke-virtual {p2}, Lcom/zte/toolsdk/widget/RemoteViews;->getLayoutId()I

    .line 136
    .line 137
    .line 138
    move-result p4

    .line 139
    invoke-virtual {p1, p4, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object p3

    .line 143
    :goto_2
    if-eqz p3, :cond_7

    .line 144
    .line 145
    iget p1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    .line 146
    .line 147
    const/4 p4, -0x1

    .line 148
    if-eq p1, p4, :cond_6

    .line 149
    .line 150
    invoke-virtual {p3, p1}, Landroid/view/View;->setId(I)V

    .line 151
    .line 152
    .line 153
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    .line 154
    .line 155
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    const p1, 0x10204c1

    .line 160
    .line 161
    .line 162
    invoke-virtual {p3, p1, p0}, Landroid/view/View;->setTagInternal(ILjava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    :cond_6
    invoke-virtual {p2}, Lcom/zte/toolsdk/widget/RemoteViews;->getLayoutId()I

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    const p1, 0x1020018

    .line 174
    .line 175
    .line 176
    invoke-virtual {p3, p1, p0}, Landroid/view/View;->setTagInternal(ILjava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    :cond_7
    return-object p3
.end method

.method private initializeFrom(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews;)V
    .locals 4

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    iget-object v0, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 6
    .line 7
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 10
    .line 11
    invoke-direct {v0, p0, v1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 15
    .line 16
    iget-object v0, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v0, p2, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 24
    .line 25
    iget-object v0, p2, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 28
    .line 29
    iget-object v0, p2, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    .line 32
    .line 33
    :goto_0
    const/4 v0, 0x0

    .line 34
    if-eqz p2, :cond_2

    .line 35
    .line 36
    iget-boolean v1, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    iput-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_2
    :goto_1
    const/4 p2, 0x1

    .line 45
    iput-boolean p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    .line 46
    .line 47
    move-object p2, p0

    .line 48
    :goto_2
    iget-object v1, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 49
    .line 50
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 51
    .line 52
    iget v1, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mLayoutId:I

    .line 53
    .line 54
    iput v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLayoutId:I

    .line 55
    .line 56
    iget v1, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    .line 57
    .line 58
    iput v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    .line 59
    .line 60
    iget v1, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    .line 61
    .line 62
    iput v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    .line 63
    .line 64
    iget-object v1, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mClassCookies:Ljava/util/Map;

    .line 65
    .line 66
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mClassCookies:Ljava/util/Map;

    .line 67
    .line 68
    iget-object v1, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mIdealSize:Landroid/util/SizeF;

    .line 69
    .line 70
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIdealSize:Landroid/util/SizeF;

    .line 71
    .line 72
    iget-wide v1, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mProviderInstanceId:J

    .line 73
    .line 74
    iput-wide v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mProviderInstanceId:J

    .line 75
    .line 76
    iget-boolean v1, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mHasDrawInstructions:Z

    .line 77
    .line 78
    iput-boolean v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mHasDrawInstructions:Z

    .line 79
    .line 80
    invoke-direct {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->hasLandscapeAndPortraitLayouts()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eqz v1, :cond_3

    .line 85
    .line 86
    iget-object v1, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 87
    .line 88
    invoke-static {v1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->createInitializedFrom(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 93
    .line 94
    iget-object v1, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 95
    .line 96
    invoke-static {v1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->createInitializedFrom(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 101
    .line 102
    :cond_3
    invoke-direct {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->hasSizedRemoteViews()Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_4

    .line 107
    .line 108
    new-instance v1, Ljava/util/ArrayList;

    .line 109
    .line 110
    iget-object v2, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 111
    .line 112
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 117
    .line 118
    .line 119
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 120
    .line 121
    iget-object v1, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 122
    .line 123
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    if-eqz v2, :cond_4

    .line 132
    .line 133
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    check-cast v2, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 138
    .line 139
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 140
    .line 141
    invoke-static {v2, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->createInitializedFrom(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    goto :goto_3

    .line 149
    :cond_4
    iget-object p2, p1, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 150
    .line 151
    if-eqz p2, :cond_5

    .line 152
    .line 153
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mClassCookies:Ljava/util/Map;

    .line 158
    .line 159
    invoke-virtual {p2, v1}, Landroid/os/Parcel;->putClassCookies(Ljava/util/Map;)V

    .line 160
    .line 161
    .line 162
    invoke-direct {p1, p2, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->writeActionsToParcel(Landroid/os/Parcel;I)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 166
    .line 167
    .line 168
    invoke-direct {p0, p2, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->readActionsFromParcel(Landroid/os/Parcel;I)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p2}, Landroid/os/Parcel;->recycle()V

    .line 172
    .line 173
    .line 174
    :cond_5
    iget-boolean p1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    .line 175
    .line 176
    if-eqz p1, :cond_6

    .line 177
    .line 178
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->reconstructCaches()V

    .line 179
    .line 180
    .line 181
    :cond_6
    return-void
.end method

.method private initializeSizedRemoteViews(Ljava/util/Iterator;)Ljava/util/Map;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "Lcom/zte/toolsdk/widget/RemoteViews;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/Class;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const v2, 0x7f7fffff    # Float.MAX_VALUE

    .line 8
    .line 9
    .line 10
    move v3, v2

    .line 11
    move-object v2, v1

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    if-eqz v4, :cond_7

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    check-cast v4, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 23
    .line 24
    invoke-direct {v4}, Lcom/zte/toolsdk/widget/RemoteViews;->getIdealSize()Landroid/util/SizeF;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    if-eqz v5, :cond_6

    .line 29
    .line 30
    invoke-virtual {v5}, Landroid/util/SizeF;->getWidth()F

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    invoke-virtual {v5}, Landroid/util/SizeF;->getHeight()F

    .line 35
    .line 36
    .line 37
    move-result v7

    .line 38
    mul-float/2addr v6, v7

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    iget-object v7, v1, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 42
    .line 43
    invoke-virtual {v4, v7}, Lcom/zte/toolsdk/widget/RemoteViews;->hasSameAppInfo(Landroid/content/pm/ApplicationInfo;)Z

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    if-eqz v7, :cond_1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 51
    .line 52
    const-string p1, "All RemoteViews must share the same package and user"

    .line 53
    .line 54
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    throw p0

    .line 58
    :cond_2
    :goto_1
    if-eqz v1, :cond_4

    .line 59
    .line 60
    cmpg-float v7, v6, v3

    .line 61
    .line 62
    if-gez v7, :cond_3

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_3
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    goto :goto_3

    .line 69
    :cond_4
    :goto_2
    if-eqz v1, :cond_5

    .line 70
    .line 71
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    :cond_5
    move-object v1, v4

    .line 75
    move v3, v6

    .line 76
    :goto_3
    invoke-direct {v4, v5}, Lcom/zte/toolsdk/widget/RemoteViews;->setIdealSize(Landroid/util/SizeF;)V

    .line 77
    .line 78
    .line 79
    if-nez v2, :cond_0

    .line 80
    .line 81
    iget-object v2, v4, Lcom/zte/toolsdk/widget/RemoteViews;->mClassCookies:Ljava/util/Map;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_6
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 85
    .line 86
    const-string p1, "Expected RemoteViews to have ideal size"

    .line 87
    .line 88
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    throw p0

    .line 92
    :cond_7
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 96
    .line 97
    return-object v2
.end method

.method static bridge synthetic j(Lcom/zte/toolsdk/widget/RemoteViews;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic l(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 2
    .line 3
    return-object p0
.end method

.method private performApply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 5

    .line 1
    invoke-virtual {p3}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->clone()Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    iget-object v0, p3, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->handler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/zte/toolsdk/widget/RemoteViews;->DEFAULT_INTERACTION_HANDLER:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 10
    .line 11
    iput-object v0, p3, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->handler:Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;

    .line 12
    .line 13
    :cond_0
    :try_start_0
    const-string v0, "com.android.internal.widget.remotecompose.player.RemoteComposePlayer"

    .line 14
    .line 15
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    const-string v1, "com.android.internal.widget.remotecompose.core.operations.Theme"

    .line 26
    .line 27
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "DARK"

    .line 32
    .line 33
    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    const-string v3, "LIGHT"

    .line 38
    .line 39
    invoke-static {v1, v3}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {v4}, Landroid/content/res/Configuration;->isNightModeActive()Z

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-eqz v4, :cond_1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    move-object v2, v3

    .line 59
    :goto_0
    const-string v3, "setTheme"

    .line 60
    .line 61
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    :cond_2
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 77
    .line 78
    if-eqz v0, :cond_3

    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    const/4 v1, 0x0

    .line 85
    :goto_1
    if-ge v1, v0, :cond_3

    .line 86
    .line 87
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    check-cast v2, Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 94
    .line 95
    invoke-virtual {v2, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$Action;->apply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .line 97
    .line 98
    add-int/lit8 v1, v1, 0x1

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :catch_0
    move-exception p0

    .line 102
    new-instance p1, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    const-string p2, "CancellationSignal performApply error: "

    .line 108
    .line 109
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    const-string p1, "RemoteViews"

    .line 124
    .line 125
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    :cond_3
    return-void
.end method

.method static bridge synthetic q(Lcom/zte/toolsdk/widget/RemoteViews;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mClassCookies:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic r(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 2
    .line 3
    return-object p0
.end method

.method private readActionsFromParcel(Landroid/os/Parcel;I)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    if-ge v1, v0, :cond_0

    .line 16
    .line 17
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->getActionFromParcel(Landroid/os/Parcel;I)Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method private reapply(Landroid/content/Context;Landroid/view/View;Landroid/view/ViewGroup;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Z)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p4}, Lcom/zte/toolsdk/widget/RemoteViews;->getRemoteViewsToReapply(Landroid/content/Context;Landroid/view/View;Landroid/util/SizeF;)Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object p1

    .line 8
    invoke-direct {p1, p2, p3, p5}, Lcom/zte/toolsdk/widget/RemoteViews;->performApply(Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V

    if-eqz p6, :cond_0

    .line 9
    instance-of p1, p2, Landroid/view/ViewGroup;

    if-eqz p1, :cond_0

    .line 10
    check-cast p2, Landroid/view/ViewGroup;

    invoke-direct {p0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->finalizeViewRecycling(Landroid/view/ViewGroup;)V

    :cond_0
    return-void
.end method

.method private reapplyNestedViews(Landroid/content/Context;Landroid/view/View;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 7

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v6, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v3, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v6}, Lcom/zte/toolsdk/widget/RemoteViews;->reapply(Landroid/content/Context;Landroid/view/View;Landroid/view/ViewGroup;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private reconstructCaches()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 12
    .line 13
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    .line 14
    .line 15
    invoke-direct {v0}, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;->getOrPut(Landroid/content/pm/ApplicationInfo;)Landroid/content/pm/ApplicationInfo;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->configureDescendantsAsChildren()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private setIdealSize(Landroid/util/SizeF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIdealSize:Landroid/util/SizeF;

    .line 2
    .line 3
    return-void
.end method

.method private static setNextRecyclableChild(Landroid/view/ViewGroup;II)V
    .locals 1

    .line 1
    const v0, 0x10204c0

    .line 2
    .line 3
    .line 4
    if-ltz p1, :cond_1

    .line 5
    .line 6
    if-lt p1, p2, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->setTagInternal(ILjava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    :goto_0
    const/4 p1, -0x1

    .line 18
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->setTagInternal(ILjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private static setStableId(Landroid/view/View;I)V
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const v0, 0x10204c2

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0, p1}, Landroid/view/View;->setTagInternal(ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private static squareDistance(Landroid/util/SizeF;Landroid/util/SizeF;)F
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/util/SizeF;->getWidth()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/util/SizeF;->getWidth()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-float/2addr v0, v1

    .line 10
    invoke-virtual {p0}, Landroid/util/SizeF;->getHeight()F

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-virtual {p1}, Landroid/util/SizeF;->getHeight()F

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    sub-float/2addr p0, p1

    .line 19
    mul-float/2addr v0, v0

    .line 20
    mul-float/2addr p0, p0

    .line 21
    add-float/2addr v0, p0

    .line 22
    return v0
.end method

.method public static startPendingIntent(Landroid/view/View;Landroid/app/PendingIntent;Landroid/util/Pair;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/app/PendingIntent;",
            "Landroid/util/Pair<",
            "Landroid/content/Intent;",
            "Landroid/app/ActivityOptions;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const-string v1, "RemoteViews"

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v3

    .line 8
    invoke-virtual {p1}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    .line 9
    .line 10
    .line 11
    move-result-object v4

    .line 12
    iget-object p0, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 13
    .line 14
    move-object v5, p0

    .line 15
    check-cast v5, Landroid/content/Intent;

    .line 16
    .line 17
    iget-object p0, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p0, Landroid/app/ActivityOptions;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 22
    .line 23
    .line 24
    move-result-object v9

    .line 25
    const/4 v6, 0x0

    .line 26
    const/4 v7, 0x0

    .line 27
    const/4 v8, 0x0

    .line 28
    invoke-virtual/range {v3 .. v9}, Landroid/content/Context;->startIntentSender(Landroid/content/IntentSender;Landroid/content/Intent;IIILandroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :catch_0
    move-exception v0

    .line 34
    move-object p0, v0

    .line 35
    goto :goto_0

    .line 36
    :catch_1
    move-exception v0

    .line 37
    move-object p0, v0

    .line 38
    goto :goto_1

    .line 39
    :goto_0
    const-string p1, "Cannot send pending intent due to unknown exception: "

    .line 40
    .line 41
    invoke-static {v1, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 42
    .line 43
    .line 44
    return v2

    .line 45
    :goto_1
    const-string p1, "Cannot send pending intent: "

    .line 46
    .line 47
    invoke-static {v1, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 48
    .line 49
    .line 50
    return v2
.end method

.method static bridge synthetic t(Lcom/zte/toolsdk/widget/RemoteViews;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    .line 2
    .line 3
    return p0
.end method

.method private tryAddRemoteResponse(I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getPendingIntentTemplate()Landroid/util/SparseArray;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/app/PendingIntent;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getFillInIntent()Landroid/util/SparseArray;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Landroid/content/Intent;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    new-instance v2, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->f(Landroid/app/PendingIntent;Landroid/content/Intent;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-direct {v2, p0, p1, v0}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0, v2}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method static bridge synthetic u(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic v(Lcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 2
    .line 3
    return-object p0
.end method

.method private static visitIconUri(Landroid/graphics/drawable/Icon;Ljava/util/function/Consumer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/drawable/Icon;",
            "Ljava/util/function/Consumer<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Icon;->getType()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x4

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/graphics/drawable/Icon;->getType()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x6

    .line 15
    if-ne v0, v1, :cond_1

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Icon;->getUri()Landroid/net/Uri;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p1, p0}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method static bridge synthetic w(Lcom/zte/toolsdk/widget/RemoteViews;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method private writeActionsToParcel(Landroid/os/Parcel;I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v1

    .line 12
    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 13
    .line 14
    .line 15
    :goto_1
    if-ge v1, v0, :cond_1

    .line 16
    .line 17
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/zte/toolsdk/widget/RemoteViews$Action;->getActionTag()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$Action;->writeToParcel(Landroid/os/Parcel;I)V

    .line 33
    .line 34
    .line 35
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_1
    return-void
.end method

.method private writeToParcel(Landroid/os/Parcel;ILandroid/util/SparseArray;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Parcel;",
            "I",
            "Landroid/util/SparseArray<",
            "Landroid/content/Intent;",
            ">;)V"
        }
    .end annotation

    .line 2
    :try_start_0
    const-string v0, "android.os.Parcel"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 3
    const-string v1, "allowSquashing"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 4
    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v1, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 5
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasMultipleLayouts()Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_3

    .line 6
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 7
    iget-boolean v3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    if-eqz v3, :cond_0

    .line 8
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    invoke-virtual {v3, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;->writeBitmapsToParcel(Landroid/os/Parcel;I)V

    .line 9
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    invoke-virtual {v3, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->writeToParcel(Landroid/os/Parcel;ILandroid/util/SparseArray;)V

    .line 10
    :cond_0
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {p1, p3, p2}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    .line 11
    iget-boolean p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    if-nez p3, :cond_2

    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIdealSize:Landroid/util/SizeF;

    if-nez p3, :cond_1

    goto :goto_0

    .line 12
    :cond_1
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 13
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIdealSize:Landroid/util/SizeF;

    invoke-virtual {p3, p1, p2}, Landroid/util/SizeF;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_1

    .line 14
    :cond_2
    :goto_0
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 15
    :goto_1
    iget p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLayoutId:I

    invoke-virtual {p1, p3}, Landroid/os/Parcel;->writeInt(I)V

    .line 16
    iget p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    invoke-virtual {p1, p3}, Landroid/os/Parcel;->writeInt(I)V

    .line 17
    iget p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    invoke-virtual {p1, p3}, Landroid/os/Parcel;->writeInt(I)V

    .line 18
    invoke-direct {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->writeActionsToParcel(Landroid/os/Parcel;I)V

    goto :goto_3

    .line 19
    :cond_3
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasSizedRemoteViews()Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v2, 0x2

    .line 20
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 21
    iget-boolean v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    if-eqz v2, :cond_4

    .line 22
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    invoke-virtual {v2, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;->writeBitmapsToParcel(Landroid/os/Parcel;I)V

    .line 23
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    invoke-virtual {v2, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->writeToParcel(Landroid/os/Parcel;ILandroid/util/SparseArray;)V

    .line 24
    :cond_4
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p3

    invoke-virtual {p1, p3}, Landroid/os/Parcel;->writeInt(I)V

    .line 25
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_2
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 26
    invoke-virtual {v2, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_2

    .line 27
    :cond_5
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 28
    iget-boolean v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    if-eqz v2, :cond_6

    .line 29
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    invoke-virtual {v2, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;->writeBitmapsToParcel(Landroid/os/Parcel;I)V

    .line 30
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    invoke-virtual {v2, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->writeToParcel(Landroid/os/Parcel;ILandroid/util/SparseArray;)V

    .line 31
    :cond_6
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-virtual {p3, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->writeToParcel(Landroid/os/Parcel;I)V

    .line 32
    iget-object p3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-virtual {p3, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->writeToParcel(Landroid/os/Parcel;I)V

    .line 33
    :cond_7
    :goto_3
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 34
    iget-wide p2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mProviderInstanceId:J

    invoke-virtual {p1, p2, p3}, Landroid/os/Parcel;->writeLong(J)V

    .line 35
    iget-boolean p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mHasDrawInstructions:Z

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeBoolean(Z)V

    .line 36
    const-string p0, "restoreAllowSquashing"

    sget-object p2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {p2}, [Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {v0, p0, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    .line 37
    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 38
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "write to parcel error: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "RemoteViews"

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method static bridge synthetic x(Lcom/zte/toolsdk/widget/RemoteViews;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic y(Lcom/zte/toolsdk/widget/RemoteViews;Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/zte/toolsdk/widget/RemoteViews;->apply(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic z(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->configureAsChild(Lcom/zte/toolsdk/widget/RemoteViews$HierarchyRootData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public addFlags(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    .line 2
    .line 3
    or-int/2addr v0, p1

    .line 4
    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    .line 5
    .line 6
    and-int/lit8 p1, p1, 0x6

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasSizedRemoteViews()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 33
    .line 34
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->addFlags(I)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasLandscapeAndPortraitLayouts()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->addFlags(I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->addFlags(I)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public addStableView(ILcom/zte/toolsdk/widget/RemoteViews;I)V
    .locals 6

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;

    .line 2
    .line 3
    const/4 v4, -0x1

    .line 4
    move-object v1, p0

    .line 5
    move v2, p1

    .line 6
    move-object v3, p2

    .line 7
    move v5, p3

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews;II)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v1, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public addView(ILcom/zte/toolsdk/widget/RemoteViews;)V
    .locals 1

    if-nez p2, :cond_0

    .line 1
    new-instance p2, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;

    invoke-direct {p2, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;-><init>(I)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;

    invoke-direct {v0, p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews;)V

    move-object p2, v0

    :goto_0
    invoke-direct {p0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public addView(ILcom/zte/toolsdk/widget/RemoteViews;I)V
    .locals 1

    .line 2
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews;I)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public apply(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, p1, p2, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->apply(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public apply(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Landroid/view/View;
    .locals 6

    move-object v3, p2

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews;->apply(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public apply(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)Landroid/view/View;
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->apply(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Landroid/util/SizeF;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public apply(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Landroid/util/SizeF;)Landroid/view/View;
    .locals 1

    .line 3
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    invoke-virtual {v0, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withInteractionHandler(Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object p3

    invoke-virtual {p0, p1, p2, p4, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->apply(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public apply(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Landroid/view/View;
    .locals 1

    .line 4
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    invoke-virtual {v0, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withInteractionHandler(Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object p3

    .line 5
    invoke-virtual {p3, p5}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withColorResources(Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object p3

    .line 6
    invoke-virtual {p0, p1, p2, p4, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->apply(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public applyAsync(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/util/concurrent/Executor;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;)Landroid/os/CancellationSignal;
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 1
    invoke-virtual/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews;->applyAsync(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/util/concurrent/Executor;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)Landroid/os/CancellationSignal;

    move-result-object p0

    return-object p0
.end method

.method public applyAsync(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/util/concurrent/Executor;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)Landroid/os/CancellationSignal;
    .locals 7

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 2
    invoke-virtual/range {v0 .. v6}, Lcom/zte/toolsdk/widget/RemoteViews;->applyAsync(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/util/concurrent/Executor;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Landroid/util/SizeF;)Landroid/os/CancellationSignal;

    move-result-object p0

    return-object p0
.end method

.method public applyAsync(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/util/concurrent/Executor;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Landroid/util/SizeF;)Landroid/os/CancellationSignal;
    .locals 8

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    .line 3
    invoke-virtual/range {v0 .. v7}, Lcom/zte/toolsdk/widget/RemoteViews;->applyAsync(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/util/concurrent/Executor;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Landroid/os/CancellationSignal;

    move-result-object p0

    return-object p0
.end method

.method public applyAsync(Landroid/content/Context;Landroid/view/ViewGroup;Ljava/util/concurrent/Executor;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Landroid/os/CancellationSignal;
    .locals 10

    .line 4
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    invoke-virtual {v0, p5}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withInteractionHandler(Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object p5

    move-object/from16 v0, p7

    .line 5
    invoke-virtual {p5, v0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withColorResources(Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object p5

    .line 6
    invoke-virtual {p5, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withExecutor(Ljava/util/concurrent/Executor;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object v6

    .line 7
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;

    move-object/from16 p5, p6

    invoke-virtual {p0, p1, p5}, Lcom/zte/toolsdk/widget/RemoteViews;->getRemoteViewsToApply(Landroid/content/Context;Landroid/util/SizeF;)Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object v2

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v4, p1

    move-object v3, p2

    move-object v5, p4

    invoke-direct/range {v0 .. v9}, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/view/ViewGroup;Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/view/View;ZLcom/zte/toolsdk/widget/z;)V

    .line 8
    invoke-static {v0, p3}, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->c(Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;Ljava/util/concurrent/Executor;)Landroid/os/CancellationSignal;

    move-result-object p0

    return-object p0
.end method

.method public applyWithTheme(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;I)Landroid/view/View;
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withInteractionHandler(Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    invoke-virtual {p3, p4}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withThemeResId(I)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    const/4 p4, 0x0

    .line 15
    invoke-virtual {p0, p1, p2, p4, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->apply(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public canRecycleView(Landroid/view/View;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasDrawInstructions()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    const v1, 0x1020018

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ljava/lang/Integer;

    .line 19
    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    return v0

    .line 23
    :cond_1
    const v2, 0x10204c1

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Ljava/lang/Integer;

    .line 31
    .line 32
    if-nez p1, :cond_2

    .line 33
    .line 34
    const/4 p1, -0x1

    .line 35
    goto :goto_0

    .line 36
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getLayoutId()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-ne v1, v2, :cond_3

    .line 49
    .line 50
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    .line 51
    .line 52
    if-ne p0, p1, :cond_3

    .line 53
    .line 54
    const/4 p0, 0x1

    .line 55
    return p0

    .line 56
    :cond_3
    :goto_1
    return v0
.end method

.method public clone()Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2
    iget-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    if-eqz v0, :cond_0

    .line 3
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    return-object v0

    .line 4
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "RemoteView has been attached to another RemoteView. May only clone the root of a RemoteView hierarchy."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->clone()Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object p0

    return-object p0
.end method

.method public collectAllIntents()Ljava/util/concurrent/CompletableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/CompletableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->collectAllIntentsNoComplete(Lcom/zte/toolsdk/widget/RemoteViews;)Ljava/util/concurrent/CompletableFuture;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public computeUniqueId(Lcom/zte/toolsdk/widget/RemoteViews;)J
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mIsRoot:Z

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    const-wide/16 v2, -0x1

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getProviderInstanceId()J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    cmp-long v0, p0, v2

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    shl-long/2addr p0, v1

    .line 18
    :cond_0
    return-wide p0

    .line 19
    :cond_1
    if-nez p1, :cond_2

    .line 20
    .line 21
    return-wide v2

    .line 22
    :cond_2
    invoke-virtual {p1}, Lcom/zte/toolsdk/widget/RemoteViews;->getProviderInstanceId()J

    .line 23
    .line 24
    .line 25
    move-result-wide v4

    .line 26
    cmp-long v0, v4, v2

    .line 27
    .line 28
    if-nez v0, :cond_3

    .line 29
    .line 30
    return-wide v2

    .line 31
    :cond_3
    invoke-direct {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getChildId(Lcom/zte/toolsdk/widget/RemoteViews;)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    const/4 p1, -0x1

    .line 36
    if-ne p0, p1, :cond_4

    .line 37
    .line 38
    return-wide v2

    .line 39
    :cond_4
    shl-long v0, v4, v1

    .line 40
    .line 41
    int-to-long p0, p0

    .line 42
    or-long/2addr p0, v0

    .line 43
    return-wide p0
.end method

.method public describeContents()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public estimateMemoryUsage()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;->getBitmapMemory()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getDarkTextViews()Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 2

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasFlags(I)Z

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addFlags(I)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    iget v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    .line 18
    .line 19
    and-int/lit8 v1, v1, -0x5

    .line 20
    .line 21
    iput v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    .line 22
    .line 23
    return-object v0

    .line 24
    :catchall_0
    move-exception v0

    .line 25
    iget v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    .line 26
    .line 27
    and-int/lit8 v1, v1, -0x5

    .line 28
    .line 29
    iput v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    .line 30
    .line 31
    throw v0
.end method

.method public getLayoutId()I
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasFlags(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLayoutId:I

    .line 14
    .line 15
    return p0
.end method

.method public getLayoutInflaterFactory()Landroid/view/LayoutInflater$Factory2;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLayoutInflaterFactory2:Landroid/view/LayoutInflater$Factory2;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPackage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public getProviderInstanceId()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mProviderInstanceId:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRemoteViewsToApply(Landroid/content/Context;Landroid/util/SizeF;)Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 1

    .line 7
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasSizedRemoteViews()Z

    move-result v0

    if-eqz v0, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 8
    :cond_0
    invoke-direct {p0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->findBestFitLayout(Landroid/util/SizeF;)Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object p0

    return-object p0

    .line 9
    :cond_1
    :goto_0
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->getRemoteViewsToApply(Landroid/content/Context;)Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object p0

    return-object p0
.end method

.method public getRemoteViewsToApplyIfDifferent(Landroid/util/SizeF;Landroid/util/SizeF;)Lcom/zte/toolsdk/widget/RemoteViews;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasSizedRemoteViews()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    if-nez p1, :cond_1

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->findSmallestRemoteView()Lcom/zte/toolsdk/widget/RemoteViews;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->findBestFitLayout(Landroid/util/SizeF;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :goto_0
    invoke-direct {p0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->findBestFitLayout(Landroid/util/SizeF;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    if-eq p1, p0, :cond_2

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_2
    return-object v1
.end method

.method public getSequenceNumber()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getViewId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mViewId:I

    .line 2
    .line 3
    return p0
.end method

.method public hasFlags(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplyFlags:I

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-ne p0, p1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public hasLegacyLists()Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    move v0, v1

    .line 8
    :goto_0
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-ge v0, v3, :cond_4

    .line 15
    .line 16
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 23
    .line 24
    instance-of v4, v3, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;

    .line 25
    .line 26
    if-eqz v4, :cond_0

    .line 27
    .line 28
    move-object v4, v3

    .line 29
    check-cast v4, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;

    .line 30
    .line 31
    iget-object v4, v4, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mServiceIntent:Landroid/content/Intent;

    .line 32
    .line 33
    if-nez v4, :cond_2

    .line 34
    .line 35
    :cond_0
    instance-of v4, v3, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteViewsAdapterIntent;

    .line 36
    .line 37
    if-eqz v4, :cond_1

    .line 38
    .line 39
    move-object v4, v3

    .line 40
    check-cast v4, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteViewsAdapterIntent;

    .line 41
    .line 42
    iget-object v4, v4, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteViewsAdapterIntent;->mIntent:Landroid/content/Intent;

    .line 43
    .line 44
    if-nez v4, :cond_2

    .line 45
    .line 46
    :cond_1
    instance-of v4, v3, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;

    .line 47
    .line 48
    if-eqz v4, :cond_3

    .line 49
    .line 50
    check-cast v3, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;

    .line 51
    .line 52
    invoke-static {v3}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->d(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    if-eqz v4, :cond_3

    .line 57
    .line 58
    invoke-static {v3}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->d(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v3}, Lcom/zte/toolsdk/widget/RemoteViews;->hasLegacyLists()Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-eqz v3, :cond_3

    .line 67
    .line 68
    :cond_2
    return v2

    .line 69
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 73
    .line 74
    if-eqz v0, :cond_6

    .line 75
    .line 76
    move v0, v1

    .line 77
    :goto_1
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    if-ge v0, v3, :cond_6

    .line 84
    .line 85
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    check-cast v3, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 92
    .line 93
    invoke-virtual {v3}, Lcom/zte/toolsdk/widget/RemoteViews;->hasLegacyLists()Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    if-eqz v3, :cond_5

    .line 98
    .line 99
    return v2

    .line 100
    :cond_5
    add-int/lit8 v0, v0, 0x1

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_6
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 104
    .line 105
    if-eqz v0, :cond_7

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasLegacyLists()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_7

    .line 112
    .line 113
    return v2

    .line 114
    :cond_7
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 115
    .line 116
    if-eqz p0, :cond_8

    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasLegacyLists()Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-eqz p0, :cond_8

    .line 123
    .line 124
    return v2

    .line 125
    :cond_8
    return v1
.end method

.method public hasSameAppInfo(Landroid/content/pm/ApplicationInfo;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, p1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplication:Landroid/content/pm/ApplicationInfo;

    .line 16
    .line 17
    iget p0, p0, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 18
    .line 19
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->uid:I

    .line 20
    .line 21
    if-ne p0, p1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public isLegacyListRemoteViews()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mCollectionCache:Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;->c(Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionCache;)Landroid/util/SparseArray;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/util/SparseArray;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public mergeRemoteViews(Lcom/zte/toolsdk/widget/RemoteViews;)V
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 15
    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    new-instance v1, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 24
    .line 25
    :cond_1
    iget-object v1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/4 v2, 0x0

    .line 32
    move v3, v2

    .line 33
    :goto_0
    if-ge v3, v1, :cond_2

    .line 34
    .line 35
    iget-object v4, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    check-cast v4, Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 42
    .line 43
    invoke-virtual {v4}, Lcom/zte/toolsdk/widget/RemoteViews$Action;->getUniqueKey()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v5

    .line 47
    invoke-virtual {p1, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    add-int/lit8 v3, v3, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    iget-object v0, v0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 54
    .line 55
    if-nez v0, :cond_3

    .line 56
    .line 57
    :goto_1
    return-void

    .line 58
    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    :goto_2
    if-ge v2, v1, :cond_7

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    check-cast v3, Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 69
    .line 70
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    check-cast v4, Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 75
    .line 76
    invoke-virtual {v4}, Lcom/zte/toolsdk/widget/RemoteViews$Action;->getUniqueKey()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    check-cast v5, Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 85
    .line 86
    invoke-virtual {v5}, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mergeBehavior()I

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    if-eqz v6, :cond_4

    .line 95
    .line 96
    if-nez v5, :cond_4

    .line 97
    .line 98
    iget-object v6, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v7

    .line 104
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    :cond_4
    if-eqz v5, :cond_5

    .line 111
    .line 112
    const/4 v4, 0x1

    .line 113
    if-ne v5, v4, :cond_6

    .line 114
    .line 115
    :cond_5
    iget-object v4, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 116
    .line 117
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    :cond_6
    add-int/lit8 v2, v2, 0x1

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_7
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->reconstructCaches()V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public onLoadClass(Ljava/lang/Class;)Z
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    const-class p0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteView;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public prefersAsyncApply()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    move v2, v1

    .line 11
    :goto_0
    if-ge v2, v0, :cond_1

    .line 12
    .line 13
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    check-cast v3, Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 20
    .line 21
    invoke-virtual {v3}, Lcom/zte/toolsdk/widget/RemoteViews$Action;->prefersAsyncApply()Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return v1
.end method

.method public reapply(Landroid/content/Context;Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->reapply(Landroid/content/Context;Landroid/view/View;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V

    return-void
.end method

.method public reapply(Landroid/content/Context;Landroid/view/View;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V
    .locals 8

    .line 6
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/view/ViewGroup;

    const/4 v7, 0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v7}, Lcom/zte/toolsdk/widget/RemoteViews;->reapply(Landroid/content/Context;Landroid/view/View;Landroid/view/ViewGroup;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Z)V

    return-void
.end method

.method public reapply(Landroid/content/Context;Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)V
    .locals 1

    .line 2
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    invoke-virtual {v0, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withInteractionHandler(Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object p3

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->reapply(Landroid/content/Context;Landroid/view/View;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V

    return-void
.end method

.method public reapply(Landroid/content/Context;Landroid/view/View;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)V
    .locals 1

    .line 3
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    invoke-virtual {v0, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withInteractionHandler(Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object p3

    .line 4
    invoke-virtual {p3, p5}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withColorResources(Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object p3

    .line 5
    invoke-virtual {p0, p1, p2, p4, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->reapply(Landroid/content/Context;Landroid/view/View;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;)V

    return-void
.end method

.method public reapplyAsync(Landroid/content/Context;Landroid/view/View;Ljava/util/concurrent/Executor;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;)Landroid/os/CancellationSignal;
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 1
    invoke-virtual/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews;->reapplyAsync(Landroid/content/Context;Landroid/view/View;Ljava/util/concurrent/Executor;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)Landroid/os/CancellationSignal;

    move-result-object p0

    return-object p0
.end method

.method public reapplyAsync(Landroid/content/Context;Landroid/view/View;Ljava/util/concurrent/Executor;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)Landroid/os/CancellationSignal;
    .locals 8

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 2
    invoke-virtual/range {v0 .. v7}, Lcom/zte/toolsdk/widget/RemoteViews;->reapplyAsync(Landroid/content/Context;Landroid/view/View;Ljava/util/concurrent/Executor;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Landroid/os/CancellationSignal;

    move-result-object p0

    return-object p0
.end method

.method public reapplyAsync(Landroid/content/Context;Landroid/view/View;Ljava/util/concurrent/Executor;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;Landroid/util/SizeF;Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Landroid/os/CancellationSignal;
    .locals 10

    move-object/from16 v0, p6

    .line 3
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->getRemoteViewsToReapply(Landroid/content/Context;Landroid/view/View;Landroid/util/SizeF;)Lcom/zte/toolsdk/widget/RemoteViews;

    move-result-object v2

    .line 4
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    invoke-direct {v0, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;)V

    move-object/from16 v1, p7

    invoke-virtual {v0, v1}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withColorResources(Lcom/zte/toolsdk/widget/RemoteViews$ColorResources;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object v0

    .line 5
    invoke-virtual {v0, p5}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withInteractionHandler(Lcom/zte/toolsdk/widget/RemoteViews$InteractionHandler;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object p5

    .line 6
    invoke-virtual {p5, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;->withExecutor(Ljava/util/concurrent/Executor;)Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;

    move-result-object v6

    .line 7
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;

    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p5

    move-object v3, p5

    check-cast v3, Landroid/view/ViewGroup;

    const/4 v8, 0x1

    const/4 v9, 0x0

    move-object v1, p0

    move-object v4, p1

    move-object v7, p2

    move-object v5, p4

    invoke-direct/range {v0 .. v9}, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;Lcom/zte/toolsdk/widget/RemoteViews;Landroid/view/ViewGroup;Landroid/content/Context;Lcom/zte/toolsdk/widget/RemoteViews$OnViewAppliedListener;Lcom/zte/toolsdk/widget/RemoteViews$ActionApplyParams;Landroid/view/View;ZLcom/zte/toolsdk/widget/z;)V

    .line 8
    invoke-static {v0, p3}, Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;->c(Lcom/zte/toolsdk/widget/RemoteViews$AsyncApplyTask;Ljava/util/concurrent/Executor;)Landroid/os/CancellationSignal;

    move-result-object p0

    return-object p0
.end method

.method public reduceImageSizes(II)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mBitmapCache:Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BitmapCache;->mBitmaps:Ljava/util/ArrayList;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-ge v0, v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Landroid/graphics/Bitmap;

    .line 17
    .line 18
    invoke-static {v1, p1, p2}, Landroid/graphics/drawable/Icon;->scaleDownIfNecessary(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p0, v0, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void
.end method

.method public removeAllViews(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public removeAllViewsExceptId(II)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionRemove;-><init>(II)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public removeFromParent(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoveFromParentAction;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoveFromParentAction;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public replaceRemoteCollections(I)Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    move v0, v1

    .line 7
    move v2, v0

    .line 8
    :goto_0
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-ge v0, v3, :cond_4

    .line 15
    .line 16
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 23
    .line 24
    instance-of v4, v3, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;

    .line 25
    .line 26
    const/4 v5, 0x1

    .line 27
    if-eqz v4, :cond_0

    .line 28
    .line 29
    move-object v4, v3

    .line 30
    check-cast v4, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;

    .line 31
    .line 32
    iget v6, v4, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 33
    .line 34
    if-ne v6, p1, :cond_0

    .line 35
    .line 36
    iget-object v7, v4, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mServiceIntent:Landroid/content/Intent;

    .line 37
    .line 38
    if-eqz v7, :cond_0

    .line 39
    .line 40
    new-instance v2, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;

    .line 41
    .line 42
    invoke-direct {v2, p0, v6, v7}, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILandroid/content/Intent;)V

    .line 43
    .line 44
    .line 45
    iget v3, v4, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIntentId:I

    .line 46
    .line 47
    iput v3, v2, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIntentId:I

    .line 48
    .line 49
    iput-boolean v5, v2, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;->mIsReplacedIntoAction:Z

    .line 50
    .line 51
    iget-object v3, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-virtual {v3, v0, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    :goto_1
    move v2, v5

    .line 57
    goto :goto_2

    .line 58
    :cond_0
    instance-of v4, v3, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteViewsAdapterIntent;

    .line 59
    .line 60
    if-eqz v4, :cond_1

    .line 61
    .line 62
    move-object v4, v3

    .line 63
    check-cast v4, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteViewsAdapterIntent;

    .line 64
    .line 65
    iget v6, v4, Lcom/zte/toolsdk/widget/RemoteViews$Action;->mViewId:I

    .line 66
    .line 67
    if-ne v6, p1, :cond_1

    .line 68
    .line 69
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 70
    .line 71
    new-instance v3, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;

    .line 72
    .line 73
    iget-object v4, v4, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteViewsAdapterIntent;->mIntent:Landroid/content/Intent;

    .line 74
    .line 75
    invoke-direct {v3, p0, v6, v4}, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILandroid/content/Intent;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2, v0, v3}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_1
    instance-of v4, v3, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;

    .line 83
    .line 84
    if-eqz v4, :cond_2

    .line 85
    .line 86
    check-cast v3, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;

    .line 87
    .line 88
    invoke-static {v3}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->d(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    if-eqz v4, :cond_2

    .line 93
    .line 94
    invoke-static {v3}, Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;->d(Lcom/zte/toolsdk/widget/RemoteViews$ViewGroupActionAdd;)Lcom/zte/toolsdk/widget/RemoteViews;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v3, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->replaceRemoteCollections(I)Z

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    or-int/2addr v2, v3

    .line 103
    :cond_2
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_3
    move v2, v1

    .line 107
    :cond_4
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 108
    .line 109
    if-eqz v0, :cond_5

    .line 110
    .line 111
    :goto_3
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-ge v1, v0, :cond_5

    .line 118
    .line 119
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 120
    .line 121
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    check-cast v0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 126
    .line 127
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->replaceRemoteCollections(I)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    or-int/2addr v2, v0

    .line 132
    add-int/lit8 v1, v1, 0x1

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_5
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 136
    .line 137
    if-eqz v0, :cond_6

    .line 138
    .line 139
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->replaceRemoteCollections(I)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    or-int/2addr v2, v0

    .line 144
    :cond_6
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 145
    .line 146
    if-eqz p0, :cond_7

    .line 147
    .line 148
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->replaceRemoteCollections(I)Z

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    or-int/2addr p0, v2

    .line 153
    return p0

    .line 154
    :cond_7
    return v2
.end method

.method public setAccessibilityTraversalAfter(II)V
    .locals 1

    .line 1
    const-string v0, "setAccessibilityTraversalAfter"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAccessibilityTraversalBefore(II)V
    .locals 1

    .line 1
    const-string v0, "setAccessibilityTraversalBefore"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setBitmap(ILjava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$BitmapReflectionAction;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$BitmapReflectionAction;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILjava/lang/String;Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setBlendMode(ILjava/lang/String;Landroid/graphics/BlendMode;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 2
    .line 3
    const/16 v1, 0x11

    .line 4
    .line 5
    invoke-direct {v0, p1, p2, v1, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setBoolean(ILjava/lang/String;Z)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 2
    .line 3
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-direct {v0, p1, p2, v1, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setBundle(ILjava/lang/String;Landroid/os/Bundle;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 2
    .line 3
    const/16 v1, 0xd

    .line 4
    .line 5
    invoke-direct {v0, p1, p2, v1, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setByte(ILjava/lang/String;B)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 2
    .line 3
    invoke-static {p3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    const/4 v1, 0x2

    .line 8
    invoke-direct {v0, p1, p2, v1, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setChar(ILjava/lang/String;C)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 2
    .line 3
    invoke-static {p3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    invoke-direct {v0, p1, p2, v1, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setCharSequence(ILjava/lang/String;I)V
    .locals 6

    .line 2
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;

    const/16 v3, 0xa

    const/4 v4, 0x3

    move v1, p1

    move-object v2, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;-><init>(ILjava/lang/String;III)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setCharSequence(ILjava/lang/String;Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    const/16 v1, 0xa

    invoke-direct {v0, p1, p2, v1, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setCharSequenceAttr(ILjava/lang/String;I)V
    .locals 6

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;

    .line 2
    .line 3
    const/16 v3, 0xa

    .line 4
    .line 5
    const/4 v4, 0x3

    .line 6
    move v1, p1

    .line 7
    move-object v2, p2

    .line 8
    move v5, p3

    .line 9
    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;-><init>(ILjava/lang/String;III)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setChronometer(IJLjava/lang/String;Z)V
    .locals 1

    .line 1
    const-string v0, "setBase"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->setLong(ILjava/lang/String;J)V

    .line 4
    .line 5
    .line 6
    const-string p2, "setFormat"

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p4}, Lcom/zte/toolsdk/widget/RemoteViews;->setString(ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p2, "setStarted"

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2, p5}, Lcom/zte/toolsdk/widget/RemoteViews;->setBoolean(ILjava/lang/String;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setChronometerCountDown(IZ)V
    .locals 1

    .line 1
    const-string v0, "setCountDown"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setBoolean(ILjava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setColor(ILjava/lang/String;I)V
    .locals 6

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;

    .line 2
    .line 3
    const/4 v3, 0x4

    .line 4
    const/4 v4, 0x2

    .line 5
    move v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move v5, p3

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;-><init>(ILjava/lang/String;III)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setColorAttr(ILjava/lang/String;I)V
    .locals 6

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;

    .line 2
    .line 3
    const/4 v3, 0x4

    .line 4
    const/4 v4, 0x2

    .line 5
    move v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move v5, p3

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;-><init>(ILjava/lang/String;III)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setColorInt(ILjava/lang/String;II)V
    .locals 6

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;

    .line 2
    .line 3
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v4

    .line 7
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v5

    .line 11
    const/4 v3, 0x4

    .line 12
    move v1, p1

    .line 13
    move-object v2, p2

    .line 14
    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setColorStateList(ILjava/lang/String;I)V
    .locals 6

    .line 3
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;

    const/16 v3, 0xf

    const/4 v4, 0x2

    move v1, p1

    move-object v2, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;-><init>(ILjava/lang/String;III)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setColorStateList(ILjava/lang/String;Landroid/content/res/ColorStateList;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    const/16 v1, 0xf

    invoke-direct {v0, p1, p2, v1, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setColorStateList(ILjava/lang/String;Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;)V
    .locals 6

    .line 2
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;

    const/16 v3, 0xf

    move v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setColorStateListAttr(ILjava/lang/String;I)V
    .locals 6

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;

    .line 2
    .line 3
    const/16 v3, 0xf

    .line 4
    .line 5
    const/4 v4, 0x2

    .line 6
    move v1, p1

    .line 7
    move-object v2, p2

    .line 8
    move v5, p3

    .line 9
    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;-><init>(ILjava/lang/String;III)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setCompoundButtonChecked(IZ)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetCompoundButtonCheckedAction;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetCompoundButtonCheckedAction;-><init>(IZ)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setContentDescription(ILjava/lang/CharSequence;)V
    .locals 1

    .line 1
    const-string v0, "setContentDescription"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setCharSequence(ILjava/lang/String;Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDisplayedChild(II)V
    .locals 1

    .line 1
    const-string v0, "setDisplayedChild"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setDouble(ILjava/lang/String;D)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 2
    .line 3
    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    const/4 p4, 0x7

    .line 8
    invoke-direct {v0, p1, p2, p4, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setDrawableTint(IZILandroid/graphics/PorterDuff$Mode;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawableTint;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3, p4}, Lcom/zte/toolsdk/widget/RemoteViews$SetDrawableTint;-><init>(IZILandroid/graphics/PorterDuff$Mode;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setEmptyView(II)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetEmptyView;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetEmptyView;-><init>(II)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setFloat(ILjava/lang/String;F)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 2
    .line 3
    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    const/4 v1, 0x6

    .line 8
    invoke-direct {v0, p1, p2, v1, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setFloatDimen(ILjava/lang/String;FI)V
    .locals 6

    .line 2
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ComplexUnitDimensionReflectionAction;

    const/4 v3, 0x6

    move v1, p1

    move-object v2, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$ComplexUnitDimensionReflectionAction;-><init>(ILjava/lang/String;IFI)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setFloatDimen(ILjava/lang/String;I)V
    .locals 6

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;

    const/4 v3, 0x6

    const/4 v4, 0x1

    move v1, p1

    move-object v2, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;-><init>(ILjava/lang/String;III)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setFloatDimenAttr(ILjava/lang/String;I)V
    .locals 6

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;

    .line 2
    .line 3
    const/4 v3, 0x6

    .line 4
    const/4 v4, 0x1

    .line 5
    move v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move v5, p3

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;-><init>(ILjava/lang/String;III)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setIcon(ILjava/lang/String;Landroid/graphics/drawable/Icon;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    const/16 v1, 0x10

    invoke-direct {v0, p1, p2, v1, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setIcon(ILjava/lang/String;Landroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;)V
    .locals 6

    .line 2
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;

    const/16 v3, 0x10

    move v1, p1

    move-object v2, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$NightModeReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setImageViewBitmap(ILandroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    const-string v0, "setImageBitmap"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setBitmap(ILjava/lang/String;Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setImageViewIcon(ILandroid/graphics/drawable/Icon;)V
    .locals 1

    .line 1
    const-string v0, "setImageIcon"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setIcon(ILjava/lang/String;Landroid/graphics/drawable/Icon;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setImageViewResource(II)V
    .locals 1

    .line 1
    const-string v0, "setImageResource"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setImageViewUri(ILandroid/net/Uri;)V
    .locals 1

    .line 1
    const-string v0, "setImageURI"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setUri(ILjava/lang/String;Landroid/net/Uri;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setInt(ILjava/lang/String;I)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 2
    .line 3
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    const/4 v1, 0x4

    .line 8
    invoke-direct {v0, p1, p2, v1, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setIntDimen(ILjava/lang/String;FI)V
    .locals 6

    .line 2
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ComplexUnitDimensionReflectionAction;

    const/4 v3, 0x4

    move v1, p1

    move-object v2, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$ComplexUnitDimensionReflectionAction;-><init>(ILjava/lang/String;IFI)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setIntDimen(ILjava/lang/String;I)V
    .locals 6

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;

    const/4 v3, 0x4

    const/4 v4, 0x1

    move v1, p1

    move-object v2, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;-><init>(ILjava/lang/String;III)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setIntDimenAttr(ILjava/lang/String;I)V
    .locals 6

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;

    .line 2
    .line 3
    const/4 v3, 0x4

    .line 4
    const/4 v4, 0x1

    .line 5
    move v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move v5, p3

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$AttributeReflectionAction;-><init>(ILjava/lang/String;III)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setIntTag(III)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetIntTagAction;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$SetIntTagAction;-><init>(III)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setIntent(ILjava/lang/String;Landroid/content/Intent;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 2
    .line 3
    const/16 v1, 0xe

    .line 4
    .line 5
    invoke-direct {v0, p1, p2, v1, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setLabelFor(II)V
    .locals 1

    .line 1
    const-string v0, "setLabelFor"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setLayoutInflaterFactory(Landroid/view/LayoutInflater$Factory2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLayoutInflaterFactory2:Landroid/view/LayoutInflater$Factory2;

    .line 2
    .line 3
    return-void
.end method

.method public setLightBackgroundLayoutId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLightBackgroundLayoutId:I

    .line 2
    .line 3
    return-void
.end method

.method public setLong(ILjava/lang/String;J)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 2
    .line 3
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    const/4 p4, 0x5

    .line 8
    invoke-direct {v0, p1, p2, p4, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setOnCheckedChangeResponse(ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p2, v1}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->setInteractionType(I)Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-direct {v0, p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnCheckedChangeResponse;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setOnClickFillInIntent(ILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasDrawInstructions()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getFillInIntent()Landroid/util/SparseArray;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1, p2}, Landroid/util/SparseArray;->set(ILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->tryAddRemoteResponse(I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->fromFillInIntent(Landroid/content/Intent;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setOnClickResponse(ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public setOnClickPendingIntent(ILandroid/app/PendingIntent;)V
    .locals 0

    .line 1
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->fromPendingIntent(Landroid/app/PendingIntent;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setOnClickResponse(ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setOnClickResponse(ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnClickResponse;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setOnGroupCollapsePendingIntent(ILandroid/app/PendingIntent;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnGroupCollapseResponse;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->fromPendingIntent(Landroid/app/PendingIntent;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-direct {v0, p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnGroupCollapseResponse;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setOnGroupExpandPendingIntent(ILandroid/app/PendingIntent;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnGroupExpandResponse;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->fromPendingIntent(Landroid/app/PendingIntent;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-direct {v0, p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnGroupExpandResponse;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setOnLongClickFillInIntent(ILandroid/content/Intent;[Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->fromFillInIntent(Landroid/content/Intent;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->setOnLongClickResponse(ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;[Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setOnLongClickResponse(ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;[Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnLongClickResponse;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;[Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setOnSeekBarChangeResponse(ILandroid/app/PendingIntent;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnSeekBarChangeResponse;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;->fromPendingIntent(Landroid/app/PendingIntent;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-direct {v0, p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnSeekBarChangeResponse;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews$RemoteResponse;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setOnStylusHandwritingPendingIntent(ILandroid/app/PendingIntent;)V
    .locals 1
    .annotation build Landroid/annotation/FlaggedApi;
        value = "android.view.inputmethod.home_screen_handwriting_delegator"
    .end annotation

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetOnStylusHandwritingResponse;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetOnStylusHandwritingResponse;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILandroid/app/PendingIntent;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setPendingIntentTemplate(ILandroid/app/PendingIntent;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->hasDrawInstructions()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->getPendingIntentTemplate()Landroid/util/SparseArray;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1, p2}, Landroid/util/SparseArray;->set(ILjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->tryAddRemoteResponse(I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetPendingIntentTemplate;

    .line 19
    .line 20
    invoke-direct {v0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetPendingIntentTemplate;-><init>(ILandroid/app/PendingIntent;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public setProgressBackgroundTintList(ILandroid/content/res/ColorStateList;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 2
    .line 3
    const-string v1, "setProgressBackgroundTintList"

    .line 4
    .line 5
    const/16 v2, 0xf

    .line 6
    .line 7
    invoke-direct {v0, p1, v1, v2, p2}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setProgressBar(IIIZ)V
    .locals 1

    .line 1
    const-string v0, "setIndeterminate"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p4}, Lcom/zte/toolsdk/widget/RemoteViews;->setBoolean(ILjava/lang/String;Z)V

    .line 4
    .line 5
    .line 6
    if-nez p4, :cond_0

    .line 7
    .line 8
    const-string p4, "setMax"

    .line 9
    .line 10
    invoke-virtual {p0, p1, p4, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 11
    .line 12
    .line 13
    const-string p2, "setProgress"

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setProgressIndeterminateTintList(ILandroid/content/res/ColorStateList;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 2
    .line 3
    const-string v1, "setIndeterminateTintList"

    .line 4
    .line 5
    const/16 v2, 0xf

    .line 6
    .line 7
    invoke-direct {v0, p1, v1, v2, p2}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setProgressTintList(ILandroid/content/res/ColorStateList;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 2
    .line 3
    const-string v1, "setProgressTintList"

    .line 4
    .line 5
    const/16 v2, 0xf

    .line 6
    .line 7
    invoke-direct {v0, p1, v1, v2, p2}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setProviderInstanceId(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mProviderInstanceId:J

    .line 2
    .line 3
    return-void
.end method

.method public setRadioGroupChecked(II)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRadioGroupCheckedAction;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetRadioGroupCheckedAction;-><init>(II)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setRelativeScrollPosition(II)V
    .locals 1

    .line 1
    const-string v0, "smoothScrollByOffset"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRemoteAdapter(IILandroid/content/Intent;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews;->setRemoteAdapter(ILandroid/content/Intent;)V

    return-void
.end method

.method public setRemoteAdapter(ILandroid/content/Intent;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2
    invoke-static {}, Landroid/appwidget/flags/Flags;->remoteAdapterConversion()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;

    invoke-direct {v0, p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILandroid/content/Intent;)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void

    .line 4
    :cond_0
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteViewsAdapterIntent;

    invoke-direct {v0, p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteViewsAdapterIntent;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILandroid/content/Intent;)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setRemoteAdapter(ILcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)V
    .locals 1

    .line 9
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;

    invoke-direct {v0, p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteCollectionItemListAdapterAction;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setRemoteAdapter(ILjava/util/ArrayList;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList<",
            "Lcom/zte/toolsdk/widget/RemoteViews;",
            ">;I)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 5
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;

    invoke-direct {v0}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;-><init>()V

    const/4 v1, 0x0

    .line 6
    :goto_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    int-to-long v2, v1

    .line 7
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/zte/toolsdk/widget/RemoteViews;

    invoke-virtual {v0, v2, v3, v4}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->addItem(JLcom/zte/toolsdk/widget/RemoteViews;)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {v0, p3}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->setViewTypeCount(I)Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;

    move-result-object p2

    invoke-virtual {p2}, Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems$Builder;->build()Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setRemoteAdapter(ILcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)V

    return-void
.end method

.method public setRemoteExpandableListAdapter(ILcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteExpandableListAdapterAction;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;Lcom/zte/toolsdk/widget/RemoteViews$RemoteCollectionItems;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setRemoteInputs(I[Landroid/app/RemoteInput;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 2
    .line 3
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteInputsAction;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetRemoteInputsAction;-><init>(I[Landroid/app/RemoteInput;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setRippleDrawableColor(ILandroid/content/res/ColorStateList;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetRippleDrawableColor;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$SetRippleDrawableColor;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;ILandroid/content/res/ColorStateList;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setScrollPosition(II)V
    .locals 1

    .line 1
    const-string v0, "smoothScrollToPosition"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setShort(ILjava/lang/String;S)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 2
    .line 3
    invoke-static {p3}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    const/4 v1, 0x3

    .line 8
    invoke-direct {v0, p1, p2, v1, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setString(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 2
    .line 3
    const/16 v1, 0x9

    .line 4
    .line 5
    invoke-direct {v0, p1, p2, v1, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setTextColor(II)V
    .locals 1

    .line 1
    const-string v0, "setTextColor"

    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    return-void
.end method

.method public setTextColor(ILandroid/content/res/ColorStateList;)V
    .locals 3

    .line 2
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    const-string v1, "setTextColor"

    const/16 v2, 0xf

    invoke-direct {v0, p1, v1, v2, p2}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setTextViewCompoundDrawables(IIIII)V
    .locals 7

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;

    const/4 v2, 0x0

    move v1, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;-><init>(IZIIII)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setTextViewCompoundDrawables(ILandroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;)V
    .locals 7

    .line 2
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;

    const/4 v2, 0x0

    move v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;-><init>(IZLandroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setTextViewCompoundDrawablesRelative(IIIII)V
    .locals 7

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;

    const/4 v2, 0x1

    move v1, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;-><init>(IZIIII)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setTextViewCompoundDrawablesRelative(ILandroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;)V
    .locals 7

    .line 2
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;

    const/4 v2, 0x1

    move v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/zte/toolsdk/widget/RemoteViews$TextViewDrawableAction;-><init>(IZLandroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;Landroid/graphics/drawable/Icon;)V

    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    return-void
.end method

.method public setTextViewText(ILjava/lang/CharSequence;)V
    .locals 1

    .line 1
    const-string v0, "setText"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setCharSequence(ILjava/lang/String;Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTextViewTextSize(IIF)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$TextViewSizeAction;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$TextViewSizeAction;-><init>(IIF)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setUri(ILjava/lang/String;Landroid/net/Uri;)V
    .locals 2

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p3}, Landroid/net/Uri;->getCanonicalUri()Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    invoke-static {}, Landroid/os/StrictMode;->vmFileUriExposureEnabled()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string v0, "RemoteViews.setUri()"

    .line 14
    .line 15
    invoke-virtual {p3, v0}, Landroid/net/Uri;->checkFileUriExposed(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 19
    .line 20
    const/16 v1, 0xb

    .line 21
    .line 22
    invoke-direct {v0, p1, p2, v1, p3}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setViewLayoutHeight(IFI)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;

    .line 2
    .line 3
    const/16 v1, 0x9

    .line 4
    .line 5
    invoke-direct {v0, p1, v1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;-><init>(IIFI)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setViewLayoutHeightAttr(II)V
    .locals 3

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;

    .line 2
    .line 3
    const/16 v1, 0x9

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    invoke-direct {v0, p1, v1, p2, v2}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;-><init>(IIII)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setViewLayoutHeightDimen(II)V
    .locals 3

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;

    .line 2
    .line 3
    const/16 v1, 0x9

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    invoke-direct {v0, p1, v1, p2, v2}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;-><init>(IIII)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setViewLayoutMargin(IIFI)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3, p4}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;-><init>(IIFI)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setViewLayoutMarginAttr(III)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-direct {v0, p1, p2, p3, v1}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;-><init>(IIII)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setViewLayoutMarginDimen(III)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-direct {v0, p1, p2, p3, v1}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;-><init>(IIII)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setViewLayoutWidth(IFI)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-direct {v0, p1, v1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;-><init>(IIFI)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setViewLayoutWidthAttr(II)V
    .locals 3

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    const/4 v2, 0x4

    .line 6
    invoke-direct {v0, p1, v1, p2, v2}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;-><init>(IIII)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setViewLayoutWidthDimen(II)V
    .locals 3

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    const/4 v2, 0x3

    .line 6
    invoke-direct {v0, p1, v1, p2, v2}, Lcom/zte/toolsdk/widget/RemoteViews$LayoutParamAction;-><init>(IIII)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setViewOutlinePreferredRadius(IFI)V
    .locals 1

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetViewOutlinePreferredRadiusAction;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$SetViewOutlinePreferredRadiusAction;-><init>(IFI)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setViewOutlinePreferredRadiusAttr(II)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetViewOutlinePreferredRadiusAction;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-direct {v0, p1, p2, v1}, Lcom/zte/toolsdk/widget/RemoteViews$SetViewOutlinePreferredRadiusAction;-><init>(III)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setViewOutlinePreferredRadiusDimen(II)V
    .locals 2

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$SetViewOutlinePreferredRadiusAction;

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    invoke-direct {v0, p1, p2, v1}, Lcom/zte/toolsdk/widget/RemoteViews$SetViewOutlinePreferredRadiusAction;-><init>(III)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setViewPadding(IIIII)V
    .locals 6

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ViewPaddingAction;

    .line 2
    .line 3
    move v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move v5, p5

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/zte/toolsdk/widget/RemoteViews$ViewPaddingAction;-><init>(IIIII)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setViewVisibility(II)V
    .locals 1

    .line 1
    const-string v0, "setVisibility"

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0, p2}, Lcom/zte/toolsdk/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setVoid(ILjava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;

    .line 2
    .line 3
    const/16 v1, 0x12

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, p1, p2, v1, v2}, Lcom/zte/toolsdk/widget/RemoteViews$ReflectionAction;-><init>(ILjava/lang/String;ILjava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method protected shouldUseStaticFilter()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class v0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public showNext(I)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ViewContentNavigation;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, p0, p1, v1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewContentNavigation;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;IZ)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public showPrevious(I)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, Lcom/zte/toolsdk/widget/RemoteViews$ViewContentNavigation;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, p1, v1}, Lcom/zte/toolsdk/widget/RemoteViews$ViewContentNavigation;-><init>(Lcom/zte/toolsdk/widget/RemoteViews;IZ)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->addAction(Lcom/zte/toolsdk/widget/RemoteViews$Action;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public updateAppInfo(Landroid/content/pm/ApplicationInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;->get(Landroid/content/pm/ApplicationInfo;)Landroid/content/pm/ApplicationInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v1, p1, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mApplicationInfoCache:Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$ApplicationInfoCache;->put(Landroid/content/pm/ApplicationInfo;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/zte/toolsdk/widget/RemoteViews;->configureDescendantsAsChildren()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public visitUris(Ljava/util/function/Consumer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    move v0, v1

    .line 7
    :goto_0
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge v0, v2, :cond_0

    .line 14
    .line 15
    iget-object v2, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mActions:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/zte/toolsdk/widget/RemoteViews$Action;

    .line 22
    .line 23
    invoke-virtual {v2, p1}, Lcom/zte/toolsdk/widget/RemoteViews$Action;->visitUris(Ljava/util/function/Consumer;)V

    .line 24
    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    :goto_1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-ge v1, v0, :cond_1

    .line 40
    .line 41
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mSizedRemoteViews:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lcom/zte/toolsdk/widget/RemoteViews;

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->visitUris(Ljava/util/function/Consumer;)V

    .line 50
    .line 51
    .line 52
    add-int/lit8 v1, v1, 0x1

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    iget-object v0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mLandscape:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 56
    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    invoke-virtual {v0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->visitUris(Ljava/util/function/Consumer;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    iget-object p0, p0, Lcom/zte/toolsdk/widget/RemoteViews;->mPortrait:Lcom/zte/toolsdk/widget/RemoteViews;

    .line 63
    .line 64
    if-eqz p0, :cond_3

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews;->visitUris(Ljava/util/function/Consumer;)V

    .line 67
    .line 68
    .line 69
    :cond_3
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/toolsdk/widget/RemoteViews;->writeToParcel(Landroid/os/Parcel;ILandroid/util/SparseArray;)V

    return-void
.end method
